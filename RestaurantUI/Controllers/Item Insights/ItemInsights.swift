//
//  ItemInsights.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 02/09/2023.
//

import SwiftUI


struct ItemInsights: View {
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
                            Font.custom("Lato-Bold", size: 40)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    Spacer()
                    VStack {
                        VStack {
                            Text("Date:")
                                .font(
                                    Font.custom("Lato-Bold", size: 25)
                                )
                                .foregroundColor(Color("TertiaryBG"))
                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .padding(.leading)
                            HStack {
                                DropDownButton(title: "10/01/23 - 10/07/23", fontSize: 16.0, image: "calendar", alignment: .center)
//                                    .padding(.trailing)
                                    .frame(width: 300, alignment: .trailing)
                                    .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                            }
                            
                        }
                    }
                    .frame(maxWidth: 300, alignment: .trailing)
                    .padding(.bottom)
                }
                .padding(.horizontal)
                
                TopView()
                    .padding(.bottom,35)
                
                HStack() {
                    PieChartView(
                        values: [1300, 500,300,170],
                        names: ["Ice Soda", "Ice Tea", "Cold Drinks","Water"],
                        formatter: {value in String(format: "$%.2f", value)},
                        backgroundColor: Color("PrimaryBG"), widthFraction: 0.6, innerRadiusFraction: 0)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.33)
                    .shadow(color: .black.opacity(0.25), radius: 6.5, x: 0, y: 4)

                    ItemInsightsView()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.66)
                }
                .padding(.horizontal, 35)
                Spacer()
            }
            .padding(.top, 20)
        }
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}

struct ItemInsights_Previews: PreviewProvider {
    static var previews: some View {
        ItemInsights()
    }
}

struct TopView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack {
                    Text("Menu:")
                        .font(
                            Font.custom("Lato-Bold", size: 25)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    DropDownButton(title: "Happy Hour", fontSize: 20.0, alignment: .leading)
                }
                .padding(.leading, 30)
                .frame(maxWidth: 300, alignment: .trailing)
                .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                Spacer()
                
                
                VStack {
                    Text("Item Category:")
                        .font(
                            Font.custom("Lato-Bold", size: 25)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    DropDownButton(title: "All Items", fontSize: 20.0, alignment: .leading)
                }
                .frame(maxWidth: 300, alignment: .trailing)
                .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                
                
                Spacer()
                VStack {
                    Text("Filter:")
                        .font(
                            Font.custom("Lato-Bold", size: 25)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    DropDownButton(title: "Best Selling", fontSize: 20.0, alignment: .leading)
                }
                
                .frame(maxWidth: 300, alignment: .trailing)
                .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
            }
            .padding(.horizontal)
        }
    }
}
