//
//  LittleLemonDinnerMenu_ImaevTests.swift
//  LittleLemonDinnerMenu_ImaevTests
//
//  Created by Mapache on 05.02.2024.
//

import XCTest
@testable import LittleLemonDinnerMenu_Imaev

final class LittleLemonDinnerMenu_ImaevTests: XCTestCase {
    
    let viewModel = MenuViewViewModel()

    func test_checkFoodTitle() {
        let foodTitle = viewModel.foods[0]
        XCTAssertEqual(foodTitle.title, "Food 1")
    }
    
    
    func test_checkIngrediet() {
        let foodIngrediet = viewModel.foods[0]
        
        XCTAssertEqual(foodIngrediet.ingredient, [.tomatoSauce,.pasta,.tomatoSauce])
    }

}
