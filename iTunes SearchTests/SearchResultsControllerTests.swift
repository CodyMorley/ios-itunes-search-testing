//
//  SearchResultsControllerClass.swift
//  iTunes SearchTests
//
//  Created by Cody Morley on 6/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

class SearchResultsControllerTests: XCTestCase {
    
    func testForSomeResults() {
        let controller = SearchResultController()
        
        let e = expectation(description: "Wait for results")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            e.fulfill()
        }
        wait(for: [e], timeout: 2)
        XCTAssertTrue(controller.searchResults.count > 0, "Expecting at least one result for GarageBand.")
    }
    
    func testSearchResultController() {
        let mock = MockDataLoader(data: garageBandJSON, response: nil, error: nil)
        let resultsExpectation = expectation(description: "Wait for search results.")
        let controller = SearchResultController(dataLoader: mock)
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2)
        XCTAssertTrue(controller.searchResults.count == 2, "Expecting 2 results for GarageBand.")
        XCTAssertEqual("GarageBand", controller.searchResults[0].title)
        XCTAssertEqual("Apple", controller.searchResults[0].artist)
    }
    
    func testNoDataWithError() {
        let e = expectation(description: "There should be no search results.")
        let error = NSError(domain: "com.LambdaSchool.iTunesSearch", code: -1, userInfo: nil)
        
        let mockDataLoader = MockDataLoader(data: nil, response: nil, error: error)
        let searchResultController = SearchResultController(dataLoader: mockDataLoader)
        
        searchResultController.performSearch(for: "Twitter", resultType: .software) {
            XCTAssertTrue(searchResultController.searchResults.isEmpty)
            e.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
}
