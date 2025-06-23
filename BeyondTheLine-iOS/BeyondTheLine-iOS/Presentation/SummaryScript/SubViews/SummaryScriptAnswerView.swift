//
//  SummaryScriptAnswerView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/22/25.
//

import SwiftUI

struct SummaryScriptAnswerView: View {
    let quiz: SummaryScriptModel
    let toggleFeedback: () -> Void
    
    @State private var bubbleMaxWidth: CGFloat = .infinity
    @State private var answerHeight: CGFloat = 0
    @State private var feedbackHeight: CGFloat = 0

    private var totalHeight: CGFloat {
        answerHeight + (quiz.isFeedbackVisible ? feedbackHeight : 0)
    }

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer()
            
            Button {
                withAnimation {
                    toggleFeedback()
                }
            } label: {
                Image(systemName: "plus.magnifyingglass")
                    .foregroundStyle(.btlGreen50Normal)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 9)
                    .background(
                        Circle()
                            .fill(.btlWhite)
                    )
            }
            .padding(.trailing, 10)
            
            SummaryScriptAnswerSubView(
                quiz: quiz,
                bubbleMaxWidth: $bubbleMaxWidth,
                answerHeight: $answerHeight,
                feedbackHeight: $feedbackHeight
            )
            .padding(.bottom, 12)
            .animation(.easeInOut(duration: 0.3), value: totalHeight)
            .alignmentGuide(VerticalAlignment.center) { dimension in
                dimension[.top] + (totalHeight / 2)
            }
        }
    }
}
