//
//  AddNewBookView.swift
//  ReadingBooks
//
//  Created by test on 17.02.2024.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddNewBookView: View {
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publishedYear: Int?
    
    @State private var selectedCover: PhotosPickerItem?
    @State private var selectedCoverData: Data?
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedGenres = Set<Genre>()
    
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
                
                HStack {
                    PhotosPicker(selection: $selectedCover, matching: .images, photoLibrary: .shared()) {
                        Label("Add Cover", systemImage: "book.closed")
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    
                    if let selectedCoverData, let image = UIImage(data: selectedCoverData) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                            .frame(width: 100, height: 100)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                }
                
                Text("Published Year:")
                TextField("Enter publish year", value: $publishedYear, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                
                GenreSelectionView(selectedGenres: $selectedGenres)
                
                HStack {
                    Button("Cancel", role: .destructive) {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    
                    Button("Save") {
                        guard let publishedYear else { return }
                        let book = Book(title: title, author: author, publishedYear: publishedYear)
                        
                        book.genre = Array(selectedGenres)
                        
                        selectedGenres.forEach { genre in
                            genre.books.append(book)
                            context.insert(genre)
                        }
                        
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
            .task(id: selectedCover) {
                if let data = try? await selectedCover?.loadTransferable(type: Data.self) {
                    selectedCoverData = data
                }
            }
        }
    }
}

#Preview {
    AddNewBookView()
}
