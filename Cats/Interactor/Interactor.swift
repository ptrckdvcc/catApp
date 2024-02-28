//
//  Interactor.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import Foundation

@MainActor
protocol InteractorProtocol {
    func loadMoreCats(page: Int, limit: Int) async throws
}

@MainActor
struct Interactor: InteractorProtocol {
    // MARK: - Properties
    let model: Model
    let service: APIServiceProtocol
    
    // MARK: - Init
    init(model: Model, service: APIServiceProtocol = APIService()) {
        self.model = model
        self.service = service
    }

    func loadMoreCats(page: Int = 0, limit: Int) async throws {
        let cats = try await service
            .fetchCats(page: page, limit: limit)
        
        model.cats = model.cats + cats
    }
}
