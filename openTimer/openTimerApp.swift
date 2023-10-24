//
//  openTimerApp.swift
//  openTimer
//
//  Created by Juan Ruiz on 21/10/23.
//

import SwiftUI
import SwiftData

@main
struct openTimerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Routine.self,
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
            MainTimerView()
        }
        .modelContainer(sharedModelContainer)
    }
}
