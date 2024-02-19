//
//  BookListSubview.swift
//  ReadingBooks
//
//  Created by test on 19.02.2024.
//

import SwiftUI
import SwiftData

struct BookListSubview: View {
    
    @Environment(\.modelContext) private var context
    @Query private var books: [Book]
    
    var searchTerm: String
    
    init(searchTerm: String = "", bookSortOption: SortingOption = .none) {
        self.searchTerm = searchTerm
        if searchTerm.isEmpty {
            _books = Query(sort: [bookSortOption.sortOption])
        } else {
            _books = Query(filter: #Predicate { $0.title.localizedStandardContains(searchTerm)}, sort: [bookSortOption.sortOption])
        }
    }
    
    var body: some View {
        Group {
            if !books.isEmpty {
                List {
                    ForEach(books) { book in
                        BookCellView(book: book)
                    }
                    .onDelete(perform: delete(indexSet:))
                }
            } else if searchTerm.isEmpty {
                ContentUnavailableView("No Books yet, start by adding one!", systemImage: "square.stack.3d.up.slash.fill")
            } else {
                ContentUnavailableView.search(text: searchTerm)
            }
        }
    }
    
    private func delete(indexSet: IndexSet) {
        indexSet.forEach { index in
            let book = books[index]
            context.delete(book)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
