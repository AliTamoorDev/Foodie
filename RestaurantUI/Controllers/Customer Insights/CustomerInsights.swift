//
//  CustomerInsights.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 03/09/2023.
//

import SwiftUI

struct CustomerInsights: View {
    //    var employeeType: String
    // Data to be displayed in the grid
    let gridData: [CustomerInsightModel] = [
        CustomerInsightModel(name: "Total Sales", amount: 12011, percentage: 19.45),
        CustomerInsightModel(name: "Average Daily Orders", amount: 138, percentage: 20.45),
        CustomerInsightModel(name: "Total Tips", amount: 987.23, percentage: 4.76),
        CustomerInsightModel(name: "Average Order Value", amount: 37.54, percentage: 4.37),
    ]
    
    
    let columns = [
        GridItem(.flexible(minimum: 50), spacing: 27),
        GridItem(.flexible(minimum: 50), spacing: 27),
        GridItem(.flexible(minimum: 50), spacing: 27)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .top) {
                    Button {
                        
                    } label: {
                        Image("drawerButton")
                            .padding(.top,8)
                    }
                    
                    Text("CUSTOMER INSIGHTS")
                        .font(
                            Font.custom("Lato-Bold", size: 40)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                }
                .padding(.leading, 25)
                
                HStack {
                    DropDownButton(title: "10/01/23 - 10/07/23", fontSize: 16.0, image: "calendar", alignment: .center)
                        .padding(.trailing)
                        .frame(width: 260, alignment: .trailing)
                }
                .padding(.bottom,58)
                .padding(.trailing, 15)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                
                
                VStack() {
                    LazyVGrid(columns: columns, spacing: 52) {
                        
                        ForEach(gridData, id: \.id) { item in
                            CustomerInsightItemView(item: item)
                            
                        }
                        CheckInsView(item: CheckInsModel(name: "Check-Ins", newCheckIns: 47, returningCheckIns: 100, newCheckInsPercentage: 5.67, returningCheckInsPercentage: 2.98))
                        
                        AvgTipView(item: AvgTipModel(name: "Average Tip Per Order", amount: 3.67, percentage: 2.47, secondPercentage: 18.67, thirdPercentage: 1.75))
                    }
                    .padding(.horizontal, 20)
                }
                Image("bottleCap")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top, 65)
                                .padding(.trailing, 25)

            }
            .padding(.top, 30)
        }
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}


struct CustomerInsightItemView: View {
    let item: CustomerInsightModel
    
    var body: some View {
        VStack() {
            Text(item.name)
                .font(
                    Font.custom("Lato-SemiBold", size: 22)
                )
                .foregroundColor(Color("TertiaryBG"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,20)
                .padding(.top, 5)
            VStack(spacing: 0) {
                Text("$\(formatNumber(item.amount))")
                    .font(
                        Font.custom("Lato-Heavy", size: 40)
                    )
                    .foregroundColor(Color("White"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading)
                
                HStack {
                    Image("arrowGreen")
                    //                    formatNumber(item.percentage)
                    Text("\(formatNumber(item.percentage))%")
                        .font(
                            Font.custom("Lato-SemiBold", size: 18)
                        )
                        .foregroundColor(Color("WhiteLight"))
                        .frame(alignment: .center)
                    
                }
                .padding(.bottom)
                
            }
            .padding()
//            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("PrimaryBG"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
    }

}

struct CheckInsView: View {
    let item: CheckInsModel
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(
                    Font.custom("Lato-SemiBold", size: 22)
                )
                .foregroundColor(Color("TertiaryBG"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,20)
                .padding(.top, 5)
            VStack {
                
                HStack {
                    Text("New")
                        .font(
                            Font.custom("Lato-Regular", size: 18)
                        )
                        .foregroundColor(Color("WhiteLight"))
                    Spacer()
                    Text("\(formatNumber(item.newCheckIns))%")
                        .font(
                            Font.custom("Lato-Heavy", size: 30)
                        )
                        .foregroundColor(Color("White"))
                    
                    Spacer()
                    HStack {
                        Image("arrowGreen")
                        Text("\(formatNumber(item.newCheckInsPercentage))%")
                            .font(
                                Font.custom("Lato-SemiBold", size: 18)
                            )
                        .foregroundColor(Color("WhiteLight"))
                    }
                }
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity)
                
                HStack {
                    Text("Returning")
                        .font(
                            Font.custom("Lato-Regular", size: 18)
                        )
                        .foregroundColor(Color("WhiteLight"))
                    Spacer()
                    Text("\(formatNumber(item.returningCheckIns))%")
                        .font(
                            Font.custom("Lato-Heavy", size: 30)
                        )
                        .foregroundColor(Color("White"))
                    
                    Spacer()
                    HStack {
                        Image("arrowGreen")
                        Text("\(formatNumber(item.returningCheckInsPercentage))%")
                            .font(
                                Font.custom("Lato-SemiBold", size: 18)
                            )
                        .foregroundColor(Color("WhiteLight"))
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom)
                .frame(maxWidth: .infinity)

            }.padding()
        }
        .frame(maxHeight: .infinity)
        .background(Color("PrimaryBG"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
    }

}

struct AvgTipView: View {
    let item: AvgTipModel
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(
                    Font.custom("Lato-SemiBold", size: 22)
                )
                .foregroundColor(Color("TertiaryBG"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,20)
                .padding(.top, 5)
            VStack {
                HStack(spacing: 0) {
                    Text("\(formatNumber(item.percentage))%")
                        .font(
                            Font.custom("Lato-SemiBold", size: 18)
                        )
                        .foregroundColor(Color("WhiteLight"))
                        .frame(alignment: .leading)
                    
                    Text("$\(formatNumber(item.amount))")
                        .font(
                            Font.custom("Lato-Heavy", size: 40)
                        )
                        .foregroundColor(Color("White"))
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.leading)
                }
                .padding(.horizontal)
                
                
                //Returning
                HStack {
                    Text("\(formatNumber(item.thirdPercentage))%")
                        .font(
                            Font.custom("Lato-Bold", size: 20)
                        )
                        .foregroundColor(Color("WhiteLight"))
                        .frame(alignment: .leading)
                    
                    Text("\(formatNumber(item.secondPercentage))%")
                        .font(
                            Font.custom("Lato-Heavy", size: 40)
                        )
                        .foregroundColor(Color("White"))
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.leading)

                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .padding()
//            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
        .background(Color("PrimaryBG"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
    }
}



func formatNumber(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = number.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 2
    
    if let formatted = formatter.string(from: NSNumber(value: number)) {
        return formatted
    } else {
        return "\(number)"
    }
}


struct CustomerInsights_Previews: PreviewProvider {
    static var previews: some View {
        CustomerInsights()
    }
}
