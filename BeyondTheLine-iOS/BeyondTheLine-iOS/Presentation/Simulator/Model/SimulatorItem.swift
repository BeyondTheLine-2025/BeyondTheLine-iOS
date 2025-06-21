//
//  SimulatorItem.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

struct SimulatorItem {
    let rules: [String]
    let introMessage: String
    let quizs: [SimulatorQuizItem]
}

struct SimulatorQuizItem: Identifiable {
    let id: UUID
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
    let feedbacks: [String]
}
