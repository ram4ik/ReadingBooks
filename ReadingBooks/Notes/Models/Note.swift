//
//  Note.swift
//  ReadingBooks
//
//  Created by test on 17.02.2024.
//

import Foundation
import SwiftData

@Model
final class Note {
    var title: String
    var message: String
    var book: Book?
    
    init(title: String, message: String, book: Book? = nil) {
        self.title = title
        self.message = message
        self.book = book
    }
}
