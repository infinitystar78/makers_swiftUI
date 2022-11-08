//
//  Settings_TimeTests.swift
//  Recipe TimeTests
//
//  Created by M W on 08/11/2022.
//

import XCTest
@testable import Recipe_Time


private class MockUserDefaults : UserDefaults {
  
  convenience init() {
    self.init(suiteName: "MockUserDefaults")!
  }
  
  override init?(suiteName suitename: String?) {
    UserDefaults().removePersistentDomain(forName: suitename!)
    super.init(suiteName: suitename)
  }
  
}
    
    
    

final class Settings_TimeTests: XCTestCase {
    
    var sut: SettingsViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = SettingsViewModel(recipeUserDefaults: RecipeTimeUserDefaults(defaults: MockUserDefaults.standard))
        
    }

    override func tearDownWithError() throws {
        sut = nil
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_saveFirstName() throws {
        
    }
    
    func test_saveLastName() throws {
        
    }
    
    func test_numberOfTimesRun() throws {
        
    }
    
    func test_pushPreferences() throws {
        
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
