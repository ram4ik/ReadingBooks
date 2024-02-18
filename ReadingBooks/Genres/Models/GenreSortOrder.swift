//
//  GenreSortOrder.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import Foundation

enum GenreSortOrder: String, Identifiable, CaseIterable {
    case forward
    case reverse
    
    var id: Self { return self }
    
    var title: String {
        switch self {
        case .forward:
            return "Forward"
        case .reverse:
            return "Reverse"
        }
    }
    
    var sortOption: SortDescriptor<Genre> {
        switch self {
        case .forward:
            SortDescriptor(\Genre.name, order: .forward)
        case .reverse:
            SortDescriptor(\Genre.name, order: .reverse)
        }
    }
}
