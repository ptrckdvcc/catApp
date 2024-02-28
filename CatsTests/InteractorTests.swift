//
//  CatsTests.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import XCTest
@testable import CatsApp

@MainActor
final class InteractorTests: XCTestCase {
    //These properties are re-initialized at each test run
    let model = Model()
    lazy var interactor = Interactor(model: model, service: MockAPIService())
    lazy var interactorWithEmptyData = Interactor(model: model, service: EmptyMockAPIService())

    func testLoadMoreCats() async throws {
        XCTAssertEqual(model.cats.count, 0, "Model should be empty at the beginning")
        
        let limit = 2
        try await interactor.loadMoreCats(page: 0, limit: limit)
        XCTAssertEqual(model.cats.count, limit, "Wrong amount of items")
        
        try await interactor.loadMoreCats(page: 1, limit: limit)
        XCTAssertEqual(model.cats.count, limit * 2, "Wrong amount of items")
    }
    
    func testEmptyLoadMoreCats() async throws {
        XCTAssertEqual(model.cats.count, 0, "Model should be empty at the beginning")
        
        let limit = 2
        try await interactorWithEmptyData.loadMoreCats(page: 0, limit: limit)
        XCTAssertEqual(model.cats.count, 0, "Model should be empty")
        
        try await interactorWithEmptyData.loadMoreCats(page: 1, limit: limit)
        XCTAssertEqual(model.cats.count, 0, "Model should be empty")
    }
    
}

