//
//  ContentView.swift
//  ReadingBooks
//
//  Created by test on 17.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BookListView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Books")
                }
            
            GenreListView()
                .tabItem {
                    Image(systemName: "gear.circle")
                    Text("Genre")
                }
        }
    }
}

#Preview {
    ContentView()
}
