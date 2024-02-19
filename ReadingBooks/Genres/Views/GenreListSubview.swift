//
//  GenreListSubview.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import SwiftUI
import SwiftData

struct GenreListSubview: View {
    
    @Query private var genres: [Genre]
    @Environment(\.modelContext) private var context
    
    init(sortOrder: GenreSortOrder = .forward) {
        _genres = Query(FetchDescriptor<Genre>(sortBy: [sortOrder.sortOption]), animation: .snappy)
    }
    
    var body: some View {
        Group {
            if !genres.isEmpty {
                List {
                    ForEach(genres) { genre in
                        NavigationLink(value: genre) {
                            Text(genre.name)
                        }
                    }
                    .onDelete(perform: deleteGenre(indexSet:))
                }
                .navigationDestination(for: Genre.self, destination: { genre in
                    GenreDetailView(genre: genre)
                })
            } else {
                ContentUnavailableView("Time to add new Genre!", systemImage: "square.3.layers.3d.down.left.slash")
            }
        }
    }
    
    private func deleteGenre(indexSet: IndexSet) {
        indexSet.forEach { index in
            let genreToDelete = genres[index]
            context.delete(genreToDelete)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

