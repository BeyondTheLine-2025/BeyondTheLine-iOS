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
    var onSelectAnswer: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(quizItem.answers.indices, id: \.self) { index in
                BeyondTheLineSelectedButton(
                    title: quizItem.answers[index],
                    buttonState: selectedIndex == index ? .pressed : .basic,
                    action: {
                        onSelectAnswer(index)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        }
                    }
                )
            }
            Spacer()
        }
    }
}
