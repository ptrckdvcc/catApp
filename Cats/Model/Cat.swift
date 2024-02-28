//
//  Cat.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import Foundation

struct Cat: Decodable, Identifiable {
    struct Image: Decodable {
        let id: String
        let width: Int
        let height: Int
        let url: String
    }
    
    let id: String
    let name: String
    let description: String
    let image: Image?
}

extension Cat {
    var imageUrl: URL? {
        guard let image else {
            return nil
        }
        return URL(string: image.url)
    }
}
