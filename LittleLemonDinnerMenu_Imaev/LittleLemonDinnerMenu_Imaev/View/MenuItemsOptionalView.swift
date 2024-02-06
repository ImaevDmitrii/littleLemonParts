//
//  MenuItemsOptionalView.swift
//  LittleLemonDinnerMenu_Imaev
//
//  Created by Mapache on 05.02.2024.
//

import SwiftUI

struct MenuItemsOptionalView: View {
    @EnvironmentObject var viewModel: MenuViewViewModel
        
        var body: some View {
            NavigationStack {
                List {
                    
                    Section("Selected categories") {
                        Toggle(MenuCategory.food.rawValue, isOn: $viewModel.isShowFood)
                        Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.isShowDrinks)
                        Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.isShowDesserts)
                    }
                    
                    Picker("Sort by", selection: $viewModel.sortBy) {
                        ForEach(SortBy.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }
                .pickerStyle(.inline)
                .listStyle(.grouped)
            }
            .navigationTitle("Filter")
        }
    }

#Preview {
    MenuItemsOptionalView()
}
