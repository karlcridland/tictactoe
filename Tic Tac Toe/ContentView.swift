//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: newGame) {
                    Label("New Game", systemImage: "plus")
                }
            }
        }
    }
    
    private func newGame() {
        
    }
    
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
