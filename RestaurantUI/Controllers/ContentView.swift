//
//  ContentView.swift
//  RestaurantUI
//
//  Created by Ali Tamoor  on 31/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption = 0
       let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
//        ScrollView {
//            VStack(spacing: 0) {
//    Text("ASda")
//                Menu {
//                    Picker("", selection: $selectedOption) {
//                        ForEach(0..<options.count, id: \.self) { index in
//                            Text(options[index]).tag(index)
//                        }
//                    }
//                    .pickerStyle(DefaultPickerStyle())
//                } label: {
//                    Text("Selected Option: \(options[selectedOption])")
//                        .padding()
//                        .background(Color.red)
//                        .frame(maxWidth: .infinity)
//                }
//
//            }
//        }
        ItemInsights()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
