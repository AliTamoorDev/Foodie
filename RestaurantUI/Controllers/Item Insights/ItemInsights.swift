//
//  ItemInsights.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 02/09/2023.
//

import SwiftUI


struct ItemInsights: View {
    @State var itemsInsightWidth = UIScreen.main.bounds.width * 0.62
    @State var pieChartWidth = UIScreen.main.bounds.width * 0.38
    @State var isPresented = false
    @State private var dates: Set<DateComponents> = []
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Button {
                        
                    } label: {
                        Image("drawerButton")
                            .padding(.top, 8)
                    }
                    
                    Text("ITEM INSIGHTS")
                        .font(
                            Font.custom("Lato-Heavy", size: 40)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    Spacer()
                    VStack {
                        VStack(spacing: 2) {
                            Text("Date:")
                                .font(
                                    Font.custom("Lato-Bold", size: 18)
                                )
                                .foregroundColor(Color("TertiaryBG"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            //                                .padding(.leading)
                            Button {
                                isPresented.toggle()
                            } label: {
                                HStack {
                                    Text("Select Date")
                                        .frame(maxWidth: .infinity,alignment: .center)
                                        .font(
                                            Font.custom("Lato-Bold", size: 20)
                                        )
                                        .padding(.vertical, 10)
//                                        .padding(.horizontal, 15)
                                        .foregroundColor(Color("PrimaryBG"))
                                        .cornerRadius(10)
                                    Spacer()
                                    Image(systemName: "calendar")
                                        .bold()
                                    
                                        .foregroundColor(Color("SecondaryBG"))
                                        .padding(.trailing)
                                    
                                }
                                .background(content: {
                                    Color("White")
                                })
                                .cornerRadius(8)
                            }
                            .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                        }
                        
                    }
                    .frame(maxWidth: 300, alignment: .trailing)
                    .padding(.bottom)
                }
                .padding(.leading, 25)
                .padding(.trailing, 52)
                
                TopView()
                    .padding(.horizontal, 52)
                    .padding(.bottom,35)
                
                HStack() {
                    PieChartView(
                        values: [1300, 500,300,170],
                        names: ["Ice Soda", "Ice Tea", "Cold Drinks","Water"],
                        formatter: {value in String(format: "$%.2f", value)},
                        backgroundColor: Color("PrimaryBG"), widthFraction: 0.6, innerRadiusFraction: 0)
                    .shadow(color: .black.opacity(0.25), radius: 6.5, x: 0, y: 4)
                    .frame(width: pieChartWidth)

                    ItemInsightsView()
                        .frame(width: itemsInsightWidth)
//                        .padding(.trailing, 20)
                }
                .padding(.leading, 20)
                .onAppear {
                  itemsInsightWidth = UIScreen.main.bounds.width * 0.65
                  pieChartWidth = UIScreen.main.bounds.width * 0.32
                }
                Spacer()
            }
            .padding(.top, 30)
        }
        
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))

        .sheet(isPresented: $isPresented) {
            VStack {
                MultiDatePicker("Select dates", selection: $dates)
            }
            .presentationDetents([.medium, .large])
        }
    }
}

struct ItemInsights_Previews: PreviewProvider {
    static var previews: some View {
        ItemInsights()
    }
}

struct TopView: View {
    @State private var selectedOption = 0
       let options = ["Option 1", "Option 2", "Option 3"]
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(spacing: 0) {
                    Text("Menu:")
                        .font(
                            Font.custom("Lato-Bold", size: 18)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    CustomPicker(options: ["Happy Hour", "Sad Hour"])
                }
                .frame(maxWidth: 300)
                .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                Spacer(minLength: 40)
                
                VStack(spacing: 0) {
                    Text("Item Category:")
                        .font(
                            Font.custom("Lato-Bold", size: 18)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomPicker(options: ["All Items", "Special Items"])
                }
                .frame(maxWidth: 300)
                .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                
                Spacer(minLength: 40)
                VStack(spacing: 0) {
                    Text("Filter:")
                        .font(
                            Font.custom("Lato-Bold", size: 18)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    CustomPicker(options: ["Best Selling", "Worst Selling"])
                }
                .frame(maxWidth: 300)
                .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
            }
        }
    }
}
