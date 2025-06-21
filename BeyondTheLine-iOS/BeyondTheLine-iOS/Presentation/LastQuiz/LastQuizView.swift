//
//  LastQuizView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct LastQuizView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: LastQuizViewModel
    @State private var currentQuizIndex = 0
    
    var body: some View {
        LastQuizProgressView(viewModel: viewModel)
            .onAppear {
                viewModel.fetchCustomer(context: viewContext, name: "손님 이름1")
            } // 앞 단계 완성 후 id로 fetch 하도록 변경 예정
        
        if currentQuizIndex < viewModel.quizItems.count {
            let quizItem = viewModel.quizItems[currentQuizIndex]
            
            VStack(alignment: .leading, spacing: 60) {
                LastQuizQuestionView(
                    quizItem: quizItem,
                    quizIndex: currentQuizIndex
                )
                
                LastQuizSelectionContainer(
                    quizItem: quizItem,
                    totalQuiz: viewModel.quizItems.count,
                    quizIndex: $currentQuizIndex,
                    viewModel: viewModel
                )
            }
        }
    }
}
