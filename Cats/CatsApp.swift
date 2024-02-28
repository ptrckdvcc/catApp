//
//  CatsApp.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import SwiftUI

@main
@MainActor
struct CatsApp: App {
    @State var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: model,
                        interactor: Interactor(model: model))
        }
    }
}
