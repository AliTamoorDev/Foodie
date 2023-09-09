//
//  ItemInsightsView.swift
//  RestaurantUI
//
//  Created by Ali Tamoor  on 01/09/2023.
//

import SwiftUI


struct ItemInsightsView: View {

    // Data to be displayed in the grid
    let menuGridData: [ItemInsightsModel] = [
        ItemInsightsModel(name: "Ice Tea", noOfItemsSold: 33, percentage: -12.33),
        ItemInsightsModel(name: "Lemon Tea", noOfItemsSold: 69, percentage: 45.92),
        ItemInsightsModel(name: "Cold Drinks", noOfItemsSold: 40, percentage: 21.09),
        ItemInsightsModel(name: "Water", noOfItemsSold: 40, percentage: 20.19),
        ItemInsightsModel(name: "Hot Chocolate", noOfItemsSold: 9, percentage: -16.83),
    ]
    

    // Calculate the number of items in each row based on screen width
    let columns = [
        GridItem(.flexible(minimum: 50), spacing: 20),
        GridItem(.flexible(minimum: 50), spacing: 20),
//        GridItem(.flexible(minimum: 50), spacing: 20)
    ]

    var body: some View {
        VStack(alignment: .leading) {
            LazyVGrid(columns: columns, spacing:20) {
                
                ForEach(menuGridData, id: \.id) { item in
                    ItemInsightItem(item: item)
                    
                }
            }
        }
        .padding(.horizontal)
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}

struct ItemInsightsModel: Identifiable {
    let id = UUID()
    let name: String
    let status: String = "Sold"
    let noOfItemsSold: Int
    let percentage: Double
}

struct ItemInsightItem: View {
    let item: ItemInsightsModel

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(item.name)
                    .font(
                        Font.custom("Lato-Regular", size: 25)
                    )
                    .foregroundColor(Color("TertiaryBG"))
                
                Text(item.status)
                    .font(
                        Font.custom("Lato-Bold", size: 20)
                    )
                    .padding(.leading)
                    .foregroundColor(Color("WhiteLight"))
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text(String(item.noOfItemsSold))
                    .font(
                        Font.custom("Lato-Bold", size: 42)
                    )
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color("White"))
                    .padding(.leading)
                
                HStack {
                    Image(item.percentage > 0 ? "arrowGreen" : "arrowRed")
                    Text("\(String(abs(item.percentage)))%")
                        .font(
                            Font.custom("Lato-SemiBold", size: 18)
                        )
                    .foregroundColor(Color("WhiteLight"))
//                    .padding(.trailing)
                }
            }
        }
        .padding()
        .padding(.trailing , 20)
        .background(Color("PrimaryBG"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.28), radius: 10.0, x: 0, y: 4)
    }
}


struct ItemInsightsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemInsightsView()
    }
}
