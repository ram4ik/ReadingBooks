//
//  ContentView.swift
//  ReadingBooks
//
//  Created by test on 17.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var launchAddNew = false
    
    var body: some View {
        BookListView()
        
        Button("Add new book") {
            launchAddNew.toggle()
        }
        .sheet(isPresented: $launchAddNew, content: {
            AddNewBookView()
        })
    }
}

#Preview {
    ContentView()
}
