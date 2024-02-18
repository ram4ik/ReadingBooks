//
//  Book.swift
//  ReadingBooks
//
//  Created by test on 17.02.2024.
//

import Foundation
import SwiftData

@Model
final class Book {
    var title: String
    var author: String
    var publishedYear: Int
    
    @Relationship(deleteRule: .cascade, inverse: \Note.book)
    var notes = [Note]()
    
    @Relationship(deleteRule: .nullify, inverse: \Genre.books)
    var genre = [Genre]()
    
    init(title: String, author: String, publishedYear: Int) {
        self.title = title
        self.author = author
        self.publishedYear = publishedYear
    }
}
