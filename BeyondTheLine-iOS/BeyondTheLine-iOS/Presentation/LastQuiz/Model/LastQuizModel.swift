//
//  LastQuizModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

struct QuizItem: Identifiable {
    let id: UUID
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
}
