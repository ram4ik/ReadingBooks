//
//  AddNewGenre.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import SwiftUI
import SwiftData

struct AddNewGenre: View {
    
    @State private var name: String = ""
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
 
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add new genre", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                HStack {
                    Button("Save") {
                        let genre = Genre(name: name)
                        context.insert(genre)
                        
                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    
                }
                
                Spacer()
            }
            .navigationTitle("Add new Genre")
        }
    }
}
