//
//  BridgeViewModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

final class BridgeViewModel: ObservableObject {
    let content: BridgeContent
    private let step: BridgeStep
    private let customerID: UUID

    init(step: BridgeStep, customerID: UUID) {
        self.step = step
        self.content = step.content
        self.customerID = customerID
    }
    
    @MainActor
    func selectNext(coordinator: AppCoordinator) {
        switch step {
        case .finishSimulator:
            coordinator.push(.lastQuiz(customerID))
        case .finishQuiz:
            coordinator.push(.summary(customerID))
        }
    }
}
