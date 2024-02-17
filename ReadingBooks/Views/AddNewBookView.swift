//
//  AddNewBookView.swift
//  ReadingBooks
//
//  Created by test on 17.02.2024.
//

import SwiftUI
import SwiftData

struct AddNewBookView: View {
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publishedYear: Int?
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    private var isValid: Bool {
        !title.isEmpty && !author.isEmpty && publishedYear != nil
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Book title:")
                TextField("Enter title", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                Text("Author:")
                TextField("Enter book author", text: $author)
                    .textFieldStyle(.roundedBorder)
                
                Text("Published Year:")
                TextField("Enter publish year", value: $publishedYear, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                
                HStack {
                    Button("Cancel", role: .destructive) {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    
                    Button("Save") {
                        guard let publishedYear else { return }
                        let book = Book(title: title, author: author, publishedYear: publishedYear)
                        context.insert(book)
                        
                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    .disabled(!isValid)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Add New Book")
        }
    }
}

#Preview {
    AddNewBookView()
}
