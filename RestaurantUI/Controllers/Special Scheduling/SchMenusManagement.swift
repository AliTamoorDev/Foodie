//
//  EmployeeManagement.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 02/09/2023.
//

import SwiftUI

struct SchMenuManagement: View {
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
Spacer()
                        VStack {
                            Button {

                            } label: {
                                Text("Edit Special")
                                    .font(
                                        Font.custom("Lato-Bold", size: 20)
                                    )
                                    .frame(width: 150)
                                    .padding(10)
                                    .foregroundColor(Color("PrimaryBG"))
                                    .background(content: {
                                        Color("White")
                                    })
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.28), radius: 12.5, x: 0, y: 4)

                            }
                            .padding(.bottom)

                            Button {

                            } label: {
                                Text("Add Category")
                                    .font(
                                        Font.custom("Lato-Bold", size: 20)
                                    )
                                   .frame(width: 150)
                                    .padding(10)
                                    .foregroundColor(Color("PrimaryBG"))
                                    .background(content: {
                                        Color("White")
                                    })
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.28), radius: 12.5, x: 0, y: 4)

                            }

                        }
                        .padding(.bottom, 30)

                }
                .padding(.horizontal)
                
                HStack(alignment: .top) {
                    SpecialScheduling()
                        .padding(.leading, 20)
                        .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
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
                    .padding(.horizontal, 35)
                }
//                Spacer()
            }
            .padding(.top, 20)
        }
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}

struct SchMenuManagement_Previews: PreviewProvider {
    static var previews: some View {
        SchMenuManagement()
    }
}
