//
//  Network_Tests.swift
//  Recipe TimeTests
//
//  Created by M W on 08/11/2022.
//

import XCTest
@testable import Recipe_Time

enum TestRecipeService {
    case nutrition(nutrition: String)
    case recipes
}

extension TestRecipeService: Service {
    var baseURL: String {
        return "https://www.testurl.com"
    }
    
    var path: String {
        switch self {
        case .nutrition:
            return "/v1/public/nutrition"
        case .recipes:
            return "/v1/public/recipes"
        }
    }

    var parameters: [String: Any]? {
        //default
        var params: [String: Any] = ["apikey": "45348954359439fasda"]
        switch self {
            
        case .nutrition(let nutrition):
            params["nutrition"] = nutrition
        case .recipes:
            print("no parameters")
        }
        return params
    }

    var method: APIMethod {
        switch self{
        case .nutrition:
            return .get
        case .recipes:
            return .post
        }
    }
    
    
}


final class TestViewModel {
    
    let provider: NetworkServiceProvider<TestRecipeService>
    
    init(provider: NetworkServiceProvider<TestRecipeService> = NetworkServiceProvider<TestRecipeService>()){
        self.provider = provider
    }
    
}

final class Network_Tests: XCTestCase {
    
    
    var sut: TestViewModel?
    
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        sut = TestViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
