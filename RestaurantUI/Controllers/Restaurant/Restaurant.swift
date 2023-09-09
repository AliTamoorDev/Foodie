//
//  Restaurant.swift
//  TestUI
//
//  Created by Ali Tamoor  on 01/09/2023.
//

import SwiftUI

struct Restaurant: View {
    var body: some View {
        VStack(spacing: 0) {
            RestaurantHeaderView()
            OrdersView()
            RestaurantFooterView()
        }
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}

struct Restaurant_Previews: PreviewProvider {
    static var previews: some View {
        Restaurant()
    }
}

struct RestaurantHeaderView: View {
    @State var isToggled: Bool = true
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("FIRST FLOOR BAR")
                        .font(
                            Font.custom("Lato-Bold", size: 40)
                        )
                        .kerning(0.38)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("TertiaryBG"))
                        .padding(.trailing, 18)
                        .padding(.leading, 31)
                    Toggle("", isOn: $isToggled)
                        .toggleStyle(
                            ColoredToggleStyle(label: "",
                                               onColor: Color("TertiaryBG"),
                                               offColor: Color("PrimaryBG"),
                                               thumbColor: Color(UIColor.white))
                        )
                    
                        .frame(width: 60)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Undo")
                            .font(
                                Font.custom("Lato-Bold", size: 30)
                            )
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundColor(Color("White"))
                            .background(content: {
                                Color("PrimaryBG")
                            })
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 4)

                        
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Menu Access")
                            .font(
                                Font.custom("Lato-Bold", size: 30)
                            )
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundColor(Color("White"))
                            .background(content: {
                                Color("PrimaryBG")
                            })
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 4)
                        
                    }
                    .padding(.trailing, 30)
                }
            }
            .padding(.top,25)
            .padding(.bottom, 10)
        }
    }
}

struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(Animation.easeInOut(duration: 0.1))
            }
        }
        .font(.title)
        .padding(.horizontal)
    }
}

struct RestaurantFooterView: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Queue: 57")
                    .padding(.leading, 50)
                    .font(
                        Font.custom("Lato-Bold", size: 30)
                    )
                    .foregroundColor(Color("TertiaryBG"))
                Spacer()

                Image("bottleCap")
                
                Spacer()
                Text("Tips: $246.65")
                    .padding(.trailing, 44)
                    .font(
                        Font.custom("Lato-Bold", size: 30)
                    )
                    .foregroundColor(Color("TertiaryBG"))
            }
            .background(Color("PrimaryBG"))
            .cornerRadius(20, corners: [.topLeft, .topRight])
        }
        .overlay(
            RoundedCorner(radius: 20, corners: [.topLeft, .topRight])
                .stroke(Color.black, lineWidth: 2)
        )
    }
}
