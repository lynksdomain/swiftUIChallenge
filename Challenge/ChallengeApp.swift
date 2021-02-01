//
//  ChallengeApp.swift
//  Challenge
//
//  Created by Lynk on 1/29/21.
//

import SwiftUI

@main
struct ChallengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

