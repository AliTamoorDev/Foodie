//
//  ContentView.swift
//  RestaurantUI
//
//  Created by Ali Tamoor  on 31/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dates: Set<DateComponents> = []
    @State private var date = Date()
    var body: some View {
        VStack {
            Restaurant()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
