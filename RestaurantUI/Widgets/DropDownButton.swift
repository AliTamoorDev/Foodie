//
//  DropDownButton.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 02/09/2023.
//

import SwiftUI

struct DropDownButton: View {
    var title:String
    var fontSize: CGFloat
    var image = "chevron.down"
    var alignment: Alignment
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Text(title)
                    .frame(maxWidth: .infinity,alignment: alignment)
                    .font(
                        Font.custom("Lato-Bold", size: fontSize)
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .foregroundColor(Color("PrimaryBG"))
                    .cornerRadius(10)
                Spacer()
                Image(systemName: image)
                    .bold()
                
                    .foregroundColor(Color("SecondaryBG"))
                    .padding(.trailing)
                
            }
            .frame(maxWidth: .infinity)
            .background(content: {
                Color("White")
            })
            .cornerRadius(10)
        }
    }
}

struct DropDownButton_Previews: PreviewProvider {
    static var previews: some View {
        DropDownButton(title: "Title",fontSize: 20.0, alignment: .center)
    }
}
