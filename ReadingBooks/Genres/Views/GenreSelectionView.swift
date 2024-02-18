//
//  GenreSelectionView.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import SwiftUI
import SwiftData

struct GenreSelectionView: View {
    
    @Query(sort: \Genre.name) private var genres: [Genre]
    @Binding var selectedGenres: Set<Genre>
    
    var body: some View {
        List {
            Section("Leteracy Genres") {
                ForEach(genres) { genre in
                    HStack {
                        Text(genre.name)
                        Spacer()
                        Image(systemName: selectedGenres.contains(genre) ? "checkmark.circle.fill" : "circle.dashed")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if !selectedGenres.contains(genre) {
                            selectedGenres.insert(genre)
                        } else {
                            selectedGenres.remove(genre)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

