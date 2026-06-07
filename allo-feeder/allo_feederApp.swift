//
//  allo_feederApp.swift
//  allo-feeder
//
//  Created by Benjamin Wright on 07/06/2026.
//

import SwiftUI
import CoreData

@main
struct allo_feederApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
