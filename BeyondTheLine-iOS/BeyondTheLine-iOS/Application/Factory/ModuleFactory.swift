//
//  ModuleFactory.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

protocol ModuleFactoryProtocol {
    func makeSelectBackgroundView() -> SelectBackgroundView
    func makeSelectCustomerView(situationID: UUID) -> SelectCustomerView
    func makeSimulatorView(customerID: UUID) -> SimulatorView
    func makeBridgeView(customerID: UUID, step: BridgeStep) -> BridgeView
    func makeLastQuizView(customerID: UUID) -> LastQuizView
    func makeSummaryScriptView(customerID: UUID) -> SummaryScriptView
}

final class ModuleFactory: ModuleFactoryProtocol {
    static let shared = ModuleFactory()
    private init() {}
    
    func makeSelectBackgroundView() -> SelectBackgroundView {
        let viewModel = SelectBackgroundViewModel()
        let view = SelectBackgroundView(viewModel: viewModel)
        return view
    }
    
    func makeSelectCustomerView(situationID: UUID) -> SelectCustomerView {
        let viewModel = SelectCustomerViewModel(situationID: situationID)
        let view = SelectCustomerView(viewModel: viewModel)
        return view
    }
    
    func makeSimulatorView(customerID: UUID) -> SimulatorView {
        let viewModel = SimulatorViewModel(customerID: customerID)
        let view = SimulatorView(viewModel: viewModel)
        return view
    }
    
    func makeBridgeView(customerID: UUID, step: BridgeStep) -> BridgeView {
        let viewModel = BridgeViewModel(step: step, customerID: customerID) // 임의로 분기 처리
        let view = BridgeView(viewModel: viewModel)
        return view
    }
    
    func makeLastQuizView(customerID: UUID) -> LastQuizView {
        let viewModel = LastQuizViewModel(customerID: customerID)
        let view = LastQuizView(viewModel: viewModel)
        return view
    }
    
    func makeSummaryScriptView(customerID: UUID) -> SummaryScriptView {
        let viewModel = SummaryScriptViewModel(customerID: customerID)
        let view = SummaryScriptView(viewModel: viewModel)
        return view
    }
}
