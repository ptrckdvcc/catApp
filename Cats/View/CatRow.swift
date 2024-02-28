//
//  CatRow.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import SwiftUI

struct CatRow: View {
    // MARK: - Properties
    let cat: Cat
    private let imageSize = 140.0

    // MARK: - Body
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            if let url = cat.imageUrl {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: 8.0))
            }
            VStack(alignment: .leading) {
                Text(cat.name)
                    .font(.title2)

                Text(cat.description)
                    .font(.caption)
                    .lineLimit(.none)
            }
        }
    }
}

#Preview {
    CatRow(cat: TestData.shared.cat)
}
