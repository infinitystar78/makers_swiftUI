//
//  Recipe_TimeUITests.swift
//  Recipe TimeUITests
//
//  Created by M W on 03/11/2022.
//

import XCTest

final class Recipe_TimeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let scrollViewsQuery = app.scrollViews
        let ingredientsElementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Ingredients")
        let stepper = ingredientsElementsQuery.children(matching: .stepper).matching(identifier: "5").element(boundBy: 0).buttons["Increment"]
        ingredientsElementsQuery.children(matching: .stepper).matching(identifier: "5").element(boundBy: 0).buttons["Increment"].tap()
        
    
        app.buttons["Add"].tap()
        app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Back"].tap()
    

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
