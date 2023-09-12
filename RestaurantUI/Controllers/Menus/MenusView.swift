//
//  EmployeeView.swift
//  RestaurantUI
//
//  Created by Ali Tamoor  on 01/09/2023.
//

import SwiftUI


struct MenuView: View {
    var menuType: String
    // Data to be displayed in the grid
    let menuGridData: [MenuItemModel] = [
        MenuItemModel(name: "Ice Tea", price: 25, width: 100, height: 100),
        MenuItemModel(name: "Lemon Tea", price: 18, width: 100, height: 100),
        MenuItemModel(name: "Cold Coffee", price: 15, width: 100, height: 100),
        MenuItemModel(name: "Coke", price: 5, width: 100, height: 100),
        MenuItemModel(name: "Water", price: 2, width: 100, height: 100),
    ]
    

    // Calculate the number of items in each row based on screen width
    let columns = [
        GridItem(.flexible(minimum: 50), spacing: 20),
        GridItem(.flexible(minimum: 50), spacing: 20),
        GridItem(.flexible(minimum: 50), spacing: 20)
    ]

    var body: some View {
        VStack(alignment: .leading) {

            MenuRoleTypeHeaderView(menuType: menuType)
            LazyVGrid(columns: columns, spacing:20) {
                
                ForEach(menuGridData, id: \.id) { item in
                    MenuItemView(item: item)
                    
                }
            }
        }
        .ignoresSafeArea()
        .background(Color("SecondaryBG"))
    }
}

struct MenuItemModel: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let width: CGFloat
    let height: CGFloat
}

struct MenuItemView: View {
    let item: MenuItemModel
    @State var isSelected = false {
        didSet{
            toggleMenuItemProps()
        }
    }
    @State var bgColor: Color = Color("PrimaryBG")
    @State var titleColor: Color = Color("TertiaryBG")
    @State var priceColor: Color = Color("WhiteLight")
    @State var priceFontStyle = "Lato-SemiBold"

    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            
            HStack(spacing: 0) {
                Text(item.name)
                    .font(
                        Font.custom("Lato-SemiBold", size: 20)
                    )
                    .foregroundColor(titleColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading)
                Text("$\(item.price)")
                    .font(
                        Font.custom(priceFontStyle, size: 18)
                    )
                    .foregroundColor(priceColor)
                    .frame(alignment: .trailing)
                    .padding(.trailing)
            }
            .frame(height: 55)
            .background(bgColor)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.28), radius: 10.5, x: 0, y: 4)
        }
    }
    
    func toggleMenuItemProps() {
        bgColor = isSelected ?  Color("White"): Color("PrimaryBG")
        titleColor = isSelected ? Color("PrimaryBG") : Color("TertiaryBG")
        priceColor = isSelected ?  Color.red: Color("WhiteLight")
        priceFontStyle = isSelected ? "Lato-Heavy" : "Lato-SemiBold"
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuType: "Admins")
    }
}

struct MenuRoleTypeHeaderView: View {
    var menuType: String
    var body: some View {
        HStack {
            Text(menuType)
                .font(
                    Font.custom("Lato-Heavy", size: 25)
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
