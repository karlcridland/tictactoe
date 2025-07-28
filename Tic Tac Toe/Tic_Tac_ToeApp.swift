//
//  Tic_Tac_ToeApp.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

import SwiftUI

@main
struct Tic_Tac_ToeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
