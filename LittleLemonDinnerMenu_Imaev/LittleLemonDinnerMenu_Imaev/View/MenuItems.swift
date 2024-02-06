//
//  MenuItems.swift
//  LittleLemonDinnerMenu_Imaev
//
//  Created by Mapache on 05.02.2024.
//

import SwiftUI

struct MenuItems: View {
    
    @StateObject private var viewModel = MenuViewViewModel()
        
        var body: some View {
            NavigationView {
                
                ScrollView {
                    if viewModel.isShowFood {
                        MenuItemView(menuItems: viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                    }
                    if viewModel.isShowDrinks {
                        MenuItemView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                    }
                    if viewModel.isShowDesserts {
                        MenuItemView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                    }
                }
                .onAppear() {
                    viewModel.updateMenuItems()
                }
                .navigationTitle("Menu")
                .toolbar {
                    Button(action: {
                        viewModel.isOpenedOptionView.toggle()
                    }, label: {
                        Image(systemName: "slider.vertical.3")
                    })
                }
                // Opens an OptionView
                .sheet(isPresented: $viewModel.isOpenedOptionView) {
                    NavigationStack {
                        MenuItemsOptionalView().environmentObject(viewModel)
                            .toolbar {
                                Button("Done") {
                                    viewModel.updateMenuItems()
                                    viewModel.isOpenedOptionView.toggle()
                                }
                            }
                    }
                }
            }
        }
    }

#Preview {
    MenuItems()
}
