//
//  OrdersView.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 28/08/2023.
//

import SwiftUI

struct OrdersView: View {
    var orders = [
        OrderList(orderNumber: "24", name: "Jake Coppen", orders: [Order(itemName: "Green Tea", quantity: 4, price: 5), Order(itemName: "Ice Tea", quantity: 3, price: 8)]),
        OrderList(orderNumber: "25", name: "Josh HazleWood", orders: [Order(itemName: "Green Tea", quantity: 5, price: 5), Order(itemName: "Ice Tea", quantity: 2, price: 8)]),
        OrderList(orderNumber: "26", name: "Josh HazleWood", orders: [Order(itemName: "Green Tea", quantity: 1, price: 5), Order(itemName: "Ice Tea", quantity: 3, price: 8)])
    ]
    
    var body: some View {
        
        List(orders) { currentOrder in
            ExtractedView(orders: currentOrder)
                .frame(maxHeight: 300)
                .listRowBackground(Color("SecondaryBG"))
                .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
        .background(Color("SecondaryBG"))
        
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}

struct ExtractedView: View {
    var orders: OrderList
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Text("#\(orders.orderNumber)")
                        .font(
                            Font.custom("Lato-Heavy", size: 55)
                        )
                        .bold()
                        .foregroundColor(Color("TertiaryBG"))
                        .padding(20)
                    
                        .frame(maxWidth: 150, maxHeight: 190)
                        .background{
                            Color("White")
                        }
                        .cornerRadius(20)
                    //                            .padding(.leading)
                    
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(orders.name)
                        .font(
                            Font.custom("Lato-Heavy", size: 45)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .foregroundColor(Color("TertiaryBG"))
                    
                    List(orders.orders) { order in
                        HStack {
                            Text("\(order.itemName) (\(order.quantity))")
                                .font(
                                    Font.custom("Lato-Heavy", size: 30)
                                )
                                .foregroundColor(Color("White"))
                                .padding(.trailing, 25)
                            Text("$\(order.price)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(
                                    Font.custom("Lato-SemiBold", size: 25)
                                )
                                .foregroundColor(Color("WhiteLight"))
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color("PrimaryBG"))
                    }
                    .listStyle(.plain)
//                                        .frame(maxHeight: 150)
                    .scrollContentBackground(.hidden)
                    .background(Color("PrimaryBG"))
                    
                }
                
                
                
                VStack() {
                    Button {
                        
                    } label: {
                        Text("ORDER READY")
                            .font(
                                Font.custom("Lato-Heavy", size: 30)
                            )
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundColor(Color("PrimaryBG"))
                            .background(content: {
                                Color("White")
                            })
                            .cornerRadius(20)
                        
                    }
                    .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 4)
                    .padding()
                    
                    Text("Total: 23$")
                        .font(
                            Font.custom("Lato-SemiBold", size: 30)
                        )
                        .foregroundColor(Color("WhiteLight"))
                    
                }
            }
        }
        
        .frame(height: 190)
        .background {
            Color("PrimaryBG")
        }
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 4)
//        .shadow(color: Color("PrimaryBG"), radius: 5, x: 0, y: 2)
    }
}
