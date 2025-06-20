//
//  LastQuizSelectionView.swift
//  BeyondTheLine-iOS
//
//  Created by 조유진 on 6/17/25.
//

import SwiftUI

struct LastQuizSelectionView: View {
    let quizItem: QuizItem
    let selectedIndex: Int?
    let incorrectIndices: Set<Int>?
    var onSelectAnswer: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(quizItem.answers.indices, id: \.self) { index in
                let isIncorrect = incorrectIndices?.contains(index) ?? false
                let isSelected = selectedIndex == index
                
                let buttonState: BeyondTheLineSelectedButtonState = {
                    if isSelected && isIncorrect {
                        return .incorrect
                    } else if isSelected {
                        return .correct
                    } else if isIncorrect {
                        return .disabled
                    } else {
                        return .basic
                    }
                }()
                
                BeyondTheLineSelectedButton(
                    title: quizItem.answers[index],
                    buttonState: buttonState,
                    action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            onSelectAnswer(index)
                        }
                    }
                )
            }
            Spacer()
        }
        .padding(.horizontal, 18)
    }
}
