//
//  GenreDetailView.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import SwiftUI
import SwiftData

struct GenreDetailView: View {
    
    let genre: Genre
    
    var body: some View {
        VStack {
            Group {
                if genre.books.isEmpty {
                    ContentUnavailableView("No Books Under this genre", systemImage: "square.stack.3d.up.slash")
                } else {
                    List(genre.books) { book in
                        Text(book.title)
                    }
                }
            }
        }
        .navigationTitle(genre.name)
    }
}
