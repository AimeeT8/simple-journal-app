//
//  ContentView.swift
//  journal-app
//
//  Created by Temple on 2024-02-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var entries: [String] = []
    @State private var currentEntry: String = ""
    @State private var isPrivateMode: Bool = false
    @State private var showingAddEntrySheet: Bool = false
    @State private var showingEntryImage: Bool = false
    
    

    var body: some View {
        TabView {
            // Journal tab
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(entries, id: \.self) {
                            entry in VStack {
                                Image("thumbnail")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .onTapGesture {
                                        showingEntryImage.toggle()
                                    }
                                Text(entry)
                            }
                            .padding()
                        }
                    }
                }
                Button("Add Entry") {
                    showingAddEntrySheet.toggle()
                }
                .sheet(isPresented: $showingAddEntrySheet) {
                    AddEntryView(currentEntry: $currentEntry, entries: $entries)
                }
            }
            .tabItem { Label("Journal", systemImage: "book.fill") }
            
            // settings tab
            VStack {
                Toggle(isOn: $isPrivateMode) {
                    Text("Private Mode")
                }
                
                .padding()
            }
            .tabItem { Label("Settings", systemImage: "gear") }
            
        }
        
        .sheet(isPresented: $showingEntryImage) {
            Image("thumbnail").resizable().aspectRatio(contentMode: .fit)
        }
        
        
    }
}

#Preview {
    ContentView()
}
