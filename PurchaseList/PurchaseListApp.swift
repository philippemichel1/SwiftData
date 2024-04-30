//
//  PurchaseListApp.swift
//  PurchaseList
//
//  Created by Philippe MICHEL on 29/04/2024.
//

import SwiftUI
import SwiftData

@main
struct PurchaseListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Purchase.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
