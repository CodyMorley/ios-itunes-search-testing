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
        
        controller.performSearch(for: "Garageband", resultType: .software) {
            e.fulfill()
        }
        wait(for: [e], timeout: 2)
        XCTAssertTrue(controller.searchResults.count > 0, "Expecting at least one result for Garageband.")
    }
    
    func testSearchResultController() {
        let mock = MockDataLoade(data: garageBandJSON, response: nil, error: nil)
        
        let resultsExpectation = expectation(description: "Wait for search results.")
        
        let controller = SearchResultController(dataLoader: )
        
    }
    
}