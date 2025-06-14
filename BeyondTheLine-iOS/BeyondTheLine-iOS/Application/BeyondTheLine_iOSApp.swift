//
//  BeyondTheLine_iOSApp.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/6/25.
//

import SwiftUI

@main
struct BeyondTheLine_iOSApp: App {
    @StateObject private var coordinator = AppCoordinator()
    private let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootNavigationView(moduleFactory: ModuleFactory.shared)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(coordinator)
        }
    }
}
