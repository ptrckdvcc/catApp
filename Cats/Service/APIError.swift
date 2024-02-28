//
//  APIError.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import Foundation

enum APIError: Error {
    case urldoesNotExist
    case invalidServerResponse
    case unknown
    
    init(error: Error) {
        self = error as? APIError ?? .unknown
    }
}

extension APIError: LocalizedError {
    public var message: String? {
        switch self {
        case .urldoesNotExist: return "The url does Not Exist"
        case .invalidServerResponse: return "Invalid Server Response"
        case .unknown: return localizedDescription
        }
    }
}

