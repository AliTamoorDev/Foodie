//
//  CustomerModels.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 03/09/2023.
//

import Foundation

struct CustomerInsightModel: Identifiable {
    let id = UUID()
    let name: String
    let amount: Double
    let percentage: Double
}


struct CheckInsModel: Identifiable {
    let id = UUID()
    let name: String
    let newCheckIns: Double
    let returningCheckIns: Double
    let newCheckInsPercentage: Double
    let returningCheckInsPercentage: Double
}


struct AvgTipModel: Identifiable {
    let id = UUID()
    let name: String
    let amount: Double
    let percentage: Double
    let secondPercentage: Double
    let thirdPercentage: Double
}
