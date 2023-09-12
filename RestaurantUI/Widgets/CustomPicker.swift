//
//  CustomPicker.swift
//  RestaurantUI
//
//  Created by Ali Tamoor  on 12/09/2023.
//

import SwiftUI

struct Items: Identifiable, Hashable {
    let id = UUID()
    var value: String
}

struct CustomPicker: View {
    var items: [Items]
    @State var selectedItem: Items = Items(value: "")

    var body: some View {
        
        VStack {
            Menu {
                Picker(selection: $selectedItem , label:  EmptyView()) {
                    ForEach(items, id: \.self) { rang in
                        Text(rang.value)
                    }
                }
            } label: {
                customlabel
            }
        }
    }
    var customlabel: some View {
        HStack{
            Text("\(selectedItem.value)")
                .font(
                    Font.custom("Lato-Bold", size: 20.0)
                )
                .padding(.horizontal, 50)
            Image(systemName: "chevron.down")
                .bold()
                .foregroundColor(Color("SecondaryBG"))
        }
        .frame(maxWidth: .infinity, minHeight: 40)
        .foregroundColor(Color("PrimaryBG"))
        .padding(.horizontal,5)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.28), radius: 7, x: 0, y: 4)
        
        .onAppear {
            if let firstElement = items.first {
                selectedItem = firstElement
            }
        }
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker(items: [Items(value: "Red"),Items(value: "Green"),Items(value: "Blue"),Items(value: "Yellow")])
    }
}
