//
//  AddEntryView.swift
//  journal-app
//
//  Created by Temple on 2024-02-15.
//

import SwiftUI

struct AddEntryView: View {
    
    @Binding var currentEntry: String
    @Binding var entries: [String]
    @Environment(\.dismiss) var dismiss
    
    
    
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fille")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                        .padding()
                }

            }
            TextField("emter your journal entry...", text: $currentEntry)
                .padding()
                .border(Color.gray, width: 0.5)
            
            Button("Save Entry") {
                if !currentEntry.isEmpty {
                    entries.append(currentEntry)
                    currentEntry = ""
                }
                dismiss()
            }
            .padding()
        }
    }
}

