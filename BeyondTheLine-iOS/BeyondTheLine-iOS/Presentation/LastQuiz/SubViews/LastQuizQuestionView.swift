//
//  LastQuizQuestionView.swift
//  BeyondTheLine-iOS
//
//  Created by 조유진 on 6/17/25.
//

import SwiftUI

struct LastQuizQuestionView: View {
    var quizItem: QuizItem
    var quizIndex: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("Q\(quizIndex+1).")
                .font(.title2)
                .foregroundStyle(.btlBlue)
            
            Text(quizItem.question)
                .font(.title1)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.btlBlack)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 18)
    }
}
