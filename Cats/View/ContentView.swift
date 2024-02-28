//
//  ContentView.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    var model: Model
    let interactor: InteractorProtocol
    
    @State private var page: Int = 0
    @State private var error: APIError?
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(model.cats) { cat in
                CatRow(cat: cat)
                    .task {
                        if let last = model.cats.last, last.id == cat.id {
                            page += 1
                            await loadMoreCats()
                        }
                    }
            }
        }
        .task {
            await loadMoreCats()
        }
        .errorAlert($error) {
            Task {
               await loadMoreCats()
            }
        } dismiss: {
            //Future improvements:
            //Show a new screen for when there is no data available
        }
    }
    
}

extension ContentView {
    func loadMoreCats() async {
        do {
            try await interactor.loadMoreCats(page: page, limit: 12)
        } catch {
            self.error = APIError(error: error)
        }
    }
}

#Preview {
    ContentView(model: TestData.shared.model, 
                interactor: TestData.shared.interactor)
}
