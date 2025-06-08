//
//  BeyondTheLine_iOSApp.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/6/25.
//

import SwiftUI

@main
struct BeyondTheLine_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
