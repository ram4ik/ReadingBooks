//
//  GenreListView.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import SwiftUI
import SwiftData

struct GenreListView: View {
    
    @State private var presentAddNew = false
    @State private var sortOrder: GenreSortOrder = .forward
    
    var body: some View {
        NavigationStack {
            GenreListSubview(sortOrder: sortOrder)
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
                
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        sortOrder = sortOrder == .forward ? GenreSortOrder.reverse : GenreSortOrder.forward
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}
