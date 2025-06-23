//
//  SummaryScriptModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

struct SummaryScriptModel: Identifiable {
    let id: Int
    let order: Int
    let customerText: String
    let isWarning: Bool
    let answerText: String
    let correctAnswerText: String
    let feedbackText: String
    var isFeedbackVisible: Bool = false
}
