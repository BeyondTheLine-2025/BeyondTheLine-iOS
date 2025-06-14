//
//  RootNavigationView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct RootNavigationView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    private let moduleFactory: ModuleFactoryProtocol
    
    public init(moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            moduleFactory.makeSelectBackgroundView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .selectBackground: moduleFactory.makeSelectBackgroundView()
                    case .selectCustomer: moduleFactory.makeSelectCustomerView()
                    case .simulator: moduleFactory.makeSimulatorView()
                    case .bridge: moduleFactory.makeBridgeView()
                    case .lastQuiz: moduleFactory.makeLastQuizView()
                    case .summary: moduleFactory.makeSummaryScriptView()
                    }
                }
        }
    }
}
