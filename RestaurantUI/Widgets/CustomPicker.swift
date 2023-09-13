//
//  CustomPicker.swift
//  RestaurantUI
//
//  Created by Ali Tamoor  on 12/09/2023.
//

import SwiftUI

struct CustomPicker: View {
    @State private var selectedOption = 0
    var options:[String]
    var size: CGFloat = 20.0
    var body: some View {
        
        VStack {
            Menu {
                Picker("", selection: $selectedOption) {
                    ForEach(0..<options.count, id: \.self) { index in
                        Text(options[index]).tag(index)
                    }
                }
                .pickerStyle(DefaultPickerStyle())
            } label: {
                customlabel
            }
        }
    }
    
    var customlabel: some View {
        HStack{
            Text("\(options[selectedOption])")
                .font(
                    Font.custom("Lato-Bold", size: size)
                )
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .center)
            Image(systemName: "chevron.down")
                .padding(.trailing, 20)
                .bold()
                .foregroundColor(Color("SecondaryBG"))
        }
        .foregroundColor(Color("PrimaryBG"))
        .padding(.vertical, 10)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.28), radius: 7, x: 0, y: 4)
//        .onAppear {
//            if let firstElement = items.first {
//                selectedItem = firstElement
//            }
//        }
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker(options: ["Option 1", "Option 2", "Option 3"])
    }
}
