//
//  LastQuizSelectionContainer.swift
//  BeyondTheLine-iOS
//
//  Created by 조유진 on 6/17/25.
//

import SwiftUI

struct LastQuizSelectionContainer: View {
    let quizItem: QuizItem
    let totalQuiz: Int
    @Binding var quizIndex: Int
    let selectedIndex: Int?
    let onSelectAnswer: (Int) -> Void
    
    var body: some View {
        LastQuizSelectionView(
            quizItem: quizItem,
            selectedIndex: selectedIndex,
            onSelectAnswer: { selected in
                onSelectAnswer(selected)
                
                withAnimation {
                    if quizIndex < totalQuiz - 1 {
                        quizIndex += 1
                    }
                }
            }
        )
    }
}
