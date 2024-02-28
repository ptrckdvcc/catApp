//
//  MockAPIService.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import Foundation

struct MockAPIService: APIServiceProtocol {
    func fetchCats(page: Int, limit: Int) async throws -> [Cat] {
        if limit == 0 {
            return []
        }
        let results = TestData.shared.cats
        let offset = page * limit
        return Array(results[offset ..< limit + offset])
    }
}

struct EmptyMockAPIService: APIServiceProtocol {
    func fetchCats(page: Int, limit: Int) async throws -> [Cat] {
        return []
    }
}
