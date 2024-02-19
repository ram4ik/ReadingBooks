//
//  BookListView.swift
//  ReadingBooks
//
//  Created by test on 17.02.2024.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @Query private var books: [Book]
    @State private var presentAddNew = false
    
    @State private var searchTerm: String = ""
    
    var filteredBooks: [Book] {
        guard searchTerm.isEmpty == false else { return books }
        return books.filter {
            $0.title.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    
    var body: some View {
        NavigationStack {
            BookListSubview(searchTerm: searchTerm)
            .searchable(text: $searchTerm, prompt: "Search book title")
            .navigationTitle("Reading Books")
            .navigationDestination(for: Book.self) { book in
                BookDetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentAddNew.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $presentAddNew, content: {
                        AddNewBookView()
                    })
                }
            }
        }
    }
}

#Preview {
    BookListView()
}
