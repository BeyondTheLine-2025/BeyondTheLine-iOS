//
//  SimulatorItem.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

struct SimulatorModel {
    let introMessage: String
    let simQuizs: [SimulatorQuizModel]
}

struct SimulatorQuizModel {
    let preText: String?
    let quiz: QuizModel
    let wrongAnswer: String
    let correctAnswer: String
    let isWarning: Bool
}

struct QuizModel {
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
    let feedbacks: [String]
}
