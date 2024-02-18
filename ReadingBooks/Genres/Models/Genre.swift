//
//  Genre.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import Foundation
import SwiftData

@Model
final class Genre {
    var name: String
    var books: [Book] = []
    
    init(name: String) {
        self.name = name
    }
}
