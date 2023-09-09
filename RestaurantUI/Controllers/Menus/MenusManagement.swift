//
//  EmployeeManagement.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 02/09/2023.
//

import SwiftUI

struct MenuManagement: View {
    var body: some View {
        
        ScrollView {
            VStack {
                HStack(alignment: .top) {
                    Button {
                        
                    } label: {
                        Image("drawerButton")
                            .padding(.top, 8)
                    }
                    
                    Text("MENU MANAGEMENT")
                        .font(
                            Font.custom("Lato-Bold", size: 40)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Button {
                                
                            } label: {
                                Text("Add Special")
                                    .font(
                                        Font.custom("Lato-Bold", size: 20)
                                    )
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .foregroundColor(Color("PrimaryBG"))
                                    .background(content: {
                                        Color("White")
                                    })
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                                
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Add Category")
                                    .font(
                                        Font.custom("Lato-Bold", size: 20)
                                    )
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .foregroundColor(Color("PrimaryBG"))
                                    .background(content: {
                                        Color("White")
                                    })
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
                                
                            }
                            
                        }
                        .padding(.bottom, 30)
                        
                        Text("Special:")
                            .font(
                                Font.custom("Lato-Bold", size: 25)
                            )
                            .foregroundColor(Color("TertiaryBG"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        DropDownButton(title: "Country Night", fontSize: 20.0, alignment: .leading)
                            .shadow(color: .black.opacity(0.28), radius: 12.5, x: 0, y: 4)
                    }
                    .frame(width: 310)

                }
                .padding(.horizontal)
                
                VStack() {
                    
                    MenuView(menuType: "Drinks 1")
                        .padding(.bottom, 20)
                    MenuView(menuType: "Drinks 2")
                        .padding(.bottom, 20)
                    MenuView(menuType: "Drinks 3")
                        .padding(.bottom, 20)
                    MenuView(menuType: "Drinks 4")
                        .padding(.bottom, 20)
                    MenuView(menuType: "Drinks 5")
                        .padding(.bottom, 20)
                }
                .padding(.horizontal, 55)
                Spacer()
            }
            .padding(.top, 20)
        }
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}

struct MenuManagement_Previews: PreviewProvider {
    static var previews: some View {
        MenuManagement()
    }
}
