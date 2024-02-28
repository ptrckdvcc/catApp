//
//  URLResponse+Ext.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import Foundation

extension URLResponse {
    var isSuccessful: Bool {
        (self as? HTTPURLResponse)?.statusCode == 200
    }
}
