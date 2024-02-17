//
//  BookListView.swift
//  ReadingBooks
//
//  Created by test on 17.02.2024.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    
    @Query private var books: [Book]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    Text(book.title)
                }
            }
            .navigationTitle("Reading Books")
        }
    }
}

#Preview {
    BookListView()
}
