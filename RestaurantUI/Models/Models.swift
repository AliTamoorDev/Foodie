//
//  Models.swift
//  RestaurantUI
//
//  Created by Ali Tamoor  on 31/08/2023.
//

import Foundation



internal struct OrderList: Identifiable {
    var id = UUID()
    var orderNumber: String
    var name: String
    var orders: [Order]
}

internal struct Order: Identifiable {
    var id = UUID()
    var itemName: String
    var quantity: Int
    var price: Int
}
