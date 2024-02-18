//
//  GenreListView.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import SwiftUI
import SwiftData

struct GenreListView: View {
    
    @Query(sort: \Genre.name)
    private var genres: [Genre]
    
    @State private var presentAddNew = false
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(genres) { genre in
                    Text(genre.name)
                }
                .onDelete(perform: deleteGenre(indexSet:))
            }
            .navigationTitle("Literary Genre")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentAddNew.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $presentAddNew) {
                        AddNewGenre()
                            .presentationDetents([.fraction(0.3)])
                            .interactiveDismissDisabled()
                    }
                }
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
