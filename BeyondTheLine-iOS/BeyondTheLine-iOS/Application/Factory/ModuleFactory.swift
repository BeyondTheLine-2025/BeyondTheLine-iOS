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
    func makeSimulatorView() -> SimulatorView
    func makeBridgeView() -> BridgeView
    func makeLastQuizView() -> LastQuizView
    func makeSummaryScriptView() -> SummaryScriptView
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
    
    func makeSimulatorView() -> SimulatorView {
        let viewModel = SimulatorViewModel()
        let view = SimulatorView(viewModel: viewModel)
        return view
    }
    
    func makeBridgeView() -> BridgeView {
        let viewModel = BridgeViewModel(step: .finishSimulator) // 임의로 분기 처리
        let view = BridgeView(viewModel: viewModel)
        return view
    }
    
    func makeLastQuizView() -> LastQuizView {
        let viewModel = LastQuizViewModel()
        let view = LastQuizView(viewModel: viewModel)
        return view
    }
    
    func makeSummaryScriptView() -> SummaryScriptView {
        let viewModel = SummaryScriptViewModel()
        let view = SummaryScriptView(viewModel: viewModel)
        return view
    }
}
