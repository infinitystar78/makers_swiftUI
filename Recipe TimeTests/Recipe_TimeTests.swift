//
//  Recipe_TimeTests.swift
//  Recipe TimeTests
//
//  Created by M W on 03/11/2022.
//

import XCTest
@testable import Recipe_Time

final class Recipe_TimeTests: XCTestCase {
    
    var sut: RecipeInputModelProtocol?
    
    
  

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RecipeInputViewModel(provider: <#NetworkServiceProvider<RecipeService>#>)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
  
    func test_IngredientsTitle() throws {
        XCTAssertEqual(sut?.ingredientsTitle, "Ingredients")
                                              
    }
    
    func test_TimeToCookTitle() throws {
        XCTAssertEqual(sut?.timeToCookTitle, "Time to cook")
    }
    
    func test_ratingTitle() throws {
        XCTAssertEqual(sut?.ratingTitle, "Rating")
    }
    
    func test_portionSizeCalculation() {
        let testPortions: [Int]  = [3,4,6,9,11]
        testPortions.forEach { portion in
            
        }
        
        let newPortionSize :Int = (sut?.doublePortionSize(portionSize: 2))!
        XCTAssertEqual(newPortionSize, 4)
       
    }
    //most common assertion
    func test_saveError() {
        let save = sut?.saveRecipe()
        XCTAssertEqual(save, false, "must equal false")
        
    }
    
    func test_success() {
        let save = sut?.saveRecipe()
        XCTAssertEqual(save, true, "result must eqaul true")
    }
    

}
