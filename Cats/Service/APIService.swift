//
//  APIService.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import Foundation

protocol APIServiceProtocol {
    func fetchCats(page: Int, limit: Int) async throws -> [Cat]
}

private struct API {
    let host: String
    let base: String
    let key: String
    
    static let thecatapi = API(host: "api.thecatapi.com",
                               base: "/v1",
                               key: "live_WmNjjWvDWXI16BlXfyYz88kjkENfXnTQPhZRbeJiztVLr5dRjZfO49B4YBMGsIPl")
}

private struct Path {
    static let breeds = "breeds"
}

struct APIService: APIServiceProtocol {
    private func request<T: Decodable>(api: API = .thecatapi,
                                       path: String,
                                       query items: URLQueryItem...,
                                       type: T.Type,
                                       cachePolicy: NSURLRequest.CachePolicy = .useProtocolCachePolicy) async throws -> T {
        var components = URLComponents()
        components.scheme = "https"
        components.host = api.host
        components.path = api.base + "/" + path
        
        let keyItem = URLQueryItem(name: "api_key", value: api.key)
        components.queryItems = items + [keyItem]
        
        guard let url = components.url else {
            throw APIError.urldoesNotExist
        }

        var request = URLRequest(url: url, cachePolicy: cachePolicy)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, response) = try await URLSession.shared.data(for: request)

        guard response.isSuccessful else {
            throw APIError.invalidServerResponse
        }

        return try JSONDecoder().decode(type, from: data)
    }
}

extension APIService {
    func fetchCats(page: Int, limit: Int) async throws -> [Cat]  {
        let cats = try await request(path: Path.breeds,
                                     query: URLQueryItem(name: "page", value: String(page)),
                                            URLQueryItem(name: "limit", value: String(limit)),
                                     type: [Cat].self)
        return cats
    }
 


}

