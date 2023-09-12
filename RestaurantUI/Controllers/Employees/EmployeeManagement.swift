//
//  EmployeeManagement.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 02/09/2023.
//

import SwiftUI

struct EmployeeManagement: View {
    var body: some View {
       let admins =  [
            GridItemModel(name: "Jacob Beaudin", role: "Owner", width: 100, height: 100),
            GridItemModel(name: "Andrew Monreal", role: "Owner", width: 100, height: 100),
            GridItemModel(name: "Jake Coppen", role: "Manager", width: 100, height: 100),
            GridItemModel(name: "Andrew Monreal", role: "Owner", width: 100, height: 100),
            GridItemModel(name: "Andrew Monreal", role: "Owner", width: 100, height: 100),
        ]
        
        let employees = [
            GridItemModel(name: "Nate King", role: "Server", width: 100, height: 100),
            GridItemModel(name: "Gordon Ram", role: "Server", width: 100, height: 100),
            GridItemModel(name: "Justin Miller", role: "Server", width: 100, height: 100),
            GridItemModel(name: "James Brown", role: "Server", width: 100, height: 100),
            GridItemModel(name: "Jill Arnold", role: "Server", width: 100, height: 100),
            
        ]
        ScrollView {
            VStack {
                HStack(alignment: .top) {
                    Button {
                        
                    } label: {
                        Image("drawerButton")
                            .padding(.top,8)
                    }
                    
                    Text("EMPLOYEE MANAGEMENT")
                        .font(
                            Font.custom("Lato-Heavy", size: 40)
                        )
                        .foregroundColor(Color("TertiaryBG"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                }
                .padding(.horizontal)
                
                VStack() {
                    
                    EmployeeView(employeeType: "Admins", gridData: admins)
                        .padding(.bottom, 20)
                    EmployeeView(employeeType: "Employees", gridData: employees)
                    
                    //            Text("Please")
                    //            LazyVGrid(columns: columns, spacing: 20) {
                    //                ForEach(0..<10){ _ in
                    //                    Rectangle()
                    ////                        .frame(width: 30, height: 20)
                    //                }
                    //            }
                    //            .ignoresSafeArea()
                    //            .background(Color("SecondaryBG"))
                }
                .padding(.horizontal, 55)
            }
            .padding(.top, 30)
        }
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}

struct EmployeeManagement_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeManagement()
    }
}
