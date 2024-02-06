//
//  MenuViewViewModel.swift
//  LittleLemonDinnerMenu_Imaev
//
//  Created by Mapache on 05.02.2024.
//

import Foundation

class MenuViewViewModel: ObservableObject {
    
    
    @Published var foods: [MenuItem] = [
        MenuItem(price: 23.5, title: "Food 1", menuCategory: .food, ordersCount: 120, ingredient: [.tomatoSauce,.pasta,.tomatoSauce]),
        MenuItem(price: 10.0, title: "Food 2", menuCategory: .food, ordersCount: 54, ingredient: [.broccoli,.carrot]),
        MenuItem(price: 17.2, title: "Food 3", menuCategory: .food, ordersCount: 461, ingredient: [.spinach,.pasta]),
        MenuItem(price: 29.9, title: "Food 4", menuCategory: .food, ordersCount: 12, ingredient: [.tomatoSauce,.tomatoSauce,.carrot]),
        MenuItem(price: 5.7, title: "Food 5", menuCategory: .food, ordersCount: 43, ingredient: [.broccoli,.carrot,.spinach]),
        MenuItem(price: 13.6, title: "Food 6", menuCategory: .food, ordersCount: 35, ingredient: [.pasta]),
        MenuItem(price: 30.5, title: "Food 7", menuCategory: .food, ordersCount: 67, ingredient: [.pasta, .broccoli]),
        MenuItem(price: 9.50, title: "Food 8", menuCategory: .food, ordersCount: 12, ingredient: [.spinach, .broccoli]),
        MenuItem(price: 13.0, title: "Food 9", menuCategory: .food, ordersCount: 65, ingredient: [.tomatoSauce,.spinach]),
        MenuItem(price: 55.5, title: "Food 10", menuCategory: .food, ordersCount: 13, ingredient: [.spinach,.pasta,.tomatoSauce,.carrot]),
        MenuItem(price: 43.7, title: "Food 11", menuCategory: .food, ordersCount: 1, ingredient: [.pasta,.carrot]),
        MenuItem(price: 99.9, title: "Food 12", menuCategory: .food, ordersCount: 75, ingredient: [.carrot, .spinach,.pasta])
    ]
    
    
    @Published var drinks: [MenuItem] = [
        MenuItem(price: 18.0, title: "Drink 1", menuCategory: .drink, ordersCount: 123, ingredient: []),
        MenuItem(price: 2.0, title: "Drink 2", menuCategory: .drink, ordersCount: 41, ingredient: []),
        MenuItem(price: 7.0, title: "Drink 3", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 11.5, title: "Drink 4", menuCategory: .drink, ordersCount: 55, ingredient: []),
        MenuItem(price: 15.0, title: "Drink 5", menuCategory: .drink, ordersCount: 60, ingredient: []),
        MenuItem(price: 9.0, title: "Drink 6", menuCategory: .drink, ordersCount: 18, ingredient: []),
        MenuItem(price: 29.0, title: "Drink 7", menuCategory: .drink, ordersCount: 99, ingredient: []),
        MenuItem(price: 35.0, title: "Drink 8", menuCategory: .drink, ordersCount: 130, ingredient: [])
    ]
    
    
    @Published var desserts: [MenuItem] = [
        MenuItem(price: 20.3, title: "Dessert 1", menuCategory: .dessert, ordersCount: 5, ingredient: []),
        MenuItem(price: 17.5, title: "Dessert 2", menuCategory: .dessert, ordersCount: 50, ingredient: []),
        MenuItem(price: 19.9, title: "Dessert 3", menuCategory: .dessert, ordersCount: 140, ingredient: []),
        MenuItem(price: 11.1, title: "Dessert 4", menuCategory: .dessert, ordersCount: 30, ingredient: [])
    ]
    
    @Published var isOpenedOptionView = false
    
    @Published var isShowFood = true
    @Published var isShowDrinks = true
    @Published var isShowDesserts = true
    
    @Published var sortBy = SortBy.fromAtoZ
    
    
    func updateMenuItems() {
        switch sortBy {
        // Sorting by number
        case .mostPopular:
            foods.sort() { $0.ordersCount > $1.ordersCount }
            drinks.sort() { $0.ordersCount > $1.ordersCount }
            desserts.sort() { $0.ordersCount > $1.ordersCount }
        // Sorting by cost
        case .fromLowPrice:
            foods.sort() { $0.price < $1.price }
            drinks.sort() { $0.price < $1.price }
            desserts.sort() { $0.price < $1.price }
        // Sort by titles alphabetically and digits
        case .fromAtoZ:
            foods.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
            drinks.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
            desserts.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
        }
    }
    
    func sortByTitle(lhs: MenuItem, rhs: MenuItem) -> Bool {
        let lhsTitle = lhs.title.split(separator: " ")
        let rhsTitle = rhs.title.split(separator: " ")
        let lhsNumber = Int(lhsTitle[lhsTitle.count - 1]) ?? 0
        let rhsNumber = Int(rhsTitle[rhsTitle.count - 1]) ?? 0
        if lhsNumber != rhsNumber {
            return lhsNumber < rhsNumber
        } else {
            return lhs.title < rhs.title
        }
    }

    
    
}
