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
    let coordinator: AppCoordinator
    @Binding var quizIndex: Int
    @ObservedObject var viewModel: LastQuizViewModel
    @State private var showBottomSheet = false
    @State private var sheetType: BeyondTheLineBottomSheetType = .correct
    
    var body: some View {
        ZStack(alignment: .bottom) {
            LastQuizSelectionView(
                quizItem: quizItem,
                selectedIndex: viewModel.selectedAnswers[quizItem.id],
                incorrectIndices: viewModel.incorrectAnswers[quizItem.id],
                onSelectAnswer: { selected in
                    let isCorrect = viewModel.selectAnswer(for: quizItem.id, answerIndex: selected)
                    sheetType = isCorrect ? .correct : .incorrect
                    showBottomSheet = true
                }
            )
            .disabled(showBottomSheet)
            .beyondTheLineBottomSheet(
                isPresented: $showBottomSheet,
                sheetType: sheetType,
                description: "",
                buttonTitle: {
                    if sheetType == .correct {
                        return quizIndex == totalQuiz - 1 ? "완료" : "다음"
                    } else {
                        return "다시 선택"
                    }
                }(),
                onTapButton: {
                    if sheetType == .correct {
                        withAnimation {
                            if quizIndex < totalQuiz - 1 {
                                quizIndex += 1
                            } else {
                                viewModel.selectNext(coordinator: coordinator)
                            }
                        }
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            viewModel.resetIncorrectSelection(for: quizItem.id)
                        }
                    }
                }
            )
        }
    }
}
