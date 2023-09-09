//
//  EmployeeView.swift
//  RestaurantUI
//
//  Created by Ali Tamoor  on 01/09/2023.
//

import SwiftUI


struct EmployeeView: View {
    var employeeType: String
    // Data to be displayed in the grid
    var gridData: [GridItemModel]
    

    // Calculate the number of items in each row based on screen width
    let columns = [
        GridItem(.flexible(minimum: 50), spacing: 20),
        GridItem(.flexible(minimum: 50), spacing: 20),
        GridItem(.flexible(minimum: 50), spacing: 20)
    ]

    var body: some View {
        VStack(alignment: .leading) {
            
//            .padding(.leading)
            RoleTypeHeaderView(employeeType: employeeType)
            LazyVGrid(columns: columns, spacing:20) {
                
                    ForEach(gridData, id: \.id) { item in
                        GridItemView(item: item)
//                            .frame(width: 315, height: 77,alignment: .leading)
//                        Text("sadasd")
////                            .frame(alignment: .leading)
                    }
                
                
            }
//            .frame(alignment: .leading)
//            .padding(10)
        }
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}

struct GridItemModel: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let width: CGFloat
    let height: CGFloat
}

struct GridItemView: View {
    let item: GridItemModel

    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 0) {
                Text(item.name)
                    .font(
                        Font.custom("Lato-Regular", size: 20)
                    )
                    .foregroundColor(Color("TertiaryBG"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading)
                Rectangle().fill(Color("WhiteLight")).frame(width: 1, height: 77)
                    .padding(.trailing,25)
                Text(item.role)
                    .font(
                        Font.custom("Lato-Regular", size: 20)
                    )
                    .foregroundColor(Color("White"))
                    .frame(alignment: .trailing)
                    .padding(.trailing)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("PrimaryBG"))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.25), radius: 10.5, x: 0, y: 4)
        }
    }
}


struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView(employeeType: "Admins", gridData: [
            GridItemModel(name: "Jacob Beaudin", role: "Owner", width: 100, height: 100),
            GridItemModel(name: "Andrew Monreal", role: "Owner", width: 100, height: 100),
            GridItemModel(name: "Jake Coppen", role: "Manager", width: 100, height: 100),
            GridItemModel(name: "Andrew Monreal", role: "Owner", width: 100, height: 100),
            GridItemModel(name: "Andrew Monreal", role: "Owner", width: 100, height: 100),
        ])
    }
}

struct RoleTypeHeaderView: View {
    var employeeType: String
    var body: some View {
        HStack {
            Text(employeeType)
                .font(
                    Font.custom("Lato-Bold", size: 25)
                )
                .foregroundColor(Color("White"))
            //                .padding(.leading)
            Button {
                
            } label: {
                Image("addButton")
            }
            Spacer()
        }
    }
}
