//
//  SummaryScriptSubView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SummaryScriptSubView: View {
    @Binding var quizzes: [SummaryScriptModel]
    let customerIntro: String
    let feedbacks: [String]
    let onToggleFeedback: (SummaryScriptModel) -> Void

    var body: some View {
        VStack {
            BeyondTheLineNavigationBar(leadingType: .none, centerType: .title(title: "요약"))
                .padding(.bottom, 16)
            
            ScrollView {
                SummaryPreTextView(text: customerIntro)
                
                ForEach(quizzes) { quiz in
                    SummaryScriptContentView(quiz: quiz, toggleFeedback: {
                        onToggleFeedback(quiz)
                    })
                }
                
                SummaryFeedbackView(feedbacks: feedbacks)
            }
        }
        .background(.btlGray90)
        .toolbar(.hidden, for: .navigationBar)
    }
}
