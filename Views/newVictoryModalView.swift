//
//  newVictoryModalView.swift
//  TinyVictories
//
//  Created by Daniel Puente on 5/23/25.
//

import SwiftUI


struct NewVictoryModalView: View {
    @State private var newVictoryTitle = ""
    @State private var newVictoryDescription = ""
    
    var onSave: (_ title: String, _ description: String) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Add a New Victory")) {
                    TextField("Title", text: $newVictoryTitle)
                        .textInputAutocapitalization(.sentences)
                    
                    TextField("Description (optional)", text: $newVictoryDescription)
                        .textInputAutocapitalization(.sentences)
                }
            }
            .navigationTitle("New Victory")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onSave("", "")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(newVictoryTitle, newVictoryDescription)
                    }
                    .disabled(newVictoryTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

#Preview {
    NewVictoryModalView { _, _ in }
  }


