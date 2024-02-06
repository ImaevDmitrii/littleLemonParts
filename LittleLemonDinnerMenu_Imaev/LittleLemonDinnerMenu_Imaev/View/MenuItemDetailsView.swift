//
//  MenuItemDetailsView.swift
//  LittleLemonDinnerMenu_Imaev
//
//  Created by Mapache on 05.02.2024.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: MenuItem
    
    
    var body: some View {
        NavigationStack {
            
            LittleLemonLogo()
            if menuItem.price > 0 {
                VStack {
                    Text("Price:")
                        .fontWeight(.bold)
                    Text(String(format: "%.2f", menuItem.price))
                }
                .padding(1)
            }
            if menuItem.ordersCount > 0 {
                VStack {
                    Text("Ordered:")
                        .fontWeight(.bold)
                    Text("\(menuItem.ordersCount)")
                }
                .padding(1)
            }
            if menuItem.ingredient.count > 0 {
                VStack {
                    Text("Ingredients:")
                        .fontWeight(.bold)
                    ForEach(menuItem.ingredient, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .padding(1)
            }
            
        }
        .navigationTitle(menuItem.title)
    }
}

#Preview {
    MenuItemDetailsView(menuItem: MenuItem(price: 23.5, title: "Food 1", menuCategory: .food, ordersCount: 120, ingredient: [.tomatoSauce,.pasta,.tomatoSauce]))
}
