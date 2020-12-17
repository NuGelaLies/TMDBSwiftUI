//
//  TMDBSwiftUITests.swift
//  TMDBSwiftUITests
//
//  Created by NuGelaliee on 12/16/20.
//

import XCTest
@testable import TMDBSwiftUI

class TMDBSwiftUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiMoviePoplar() throws {
        ApiService.shared.request(locale: "PoplarMovie.json", mapping: MovieContainer<MoviesModel>.self, completion: { (result) in
            switch result {
            case .success(let model):
                XCTAssert(model.page == 1)
                XCTAssert(!model.results.isEmpty)
                XCTAssert(model.results.count == 20)
                XCTAssert(model.totalPages == 982)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        })
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
