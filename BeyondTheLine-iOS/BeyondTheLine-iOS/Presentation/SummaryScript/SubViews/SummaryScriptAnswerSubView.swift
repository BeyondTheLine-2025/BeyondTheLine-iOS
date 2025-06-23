//
//  SummaryScriptAnswerSubView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/23/25.
//

import SwiftUI

struct SummaryScriptAnswerSubView: View {
    let quiz: SummaryScriptModel
    @Binding var bubbleMaxWidth: CGFloat
    @Binding var answerHeight: CGFloat
    @Binding var feedbackHeight: CGFloat

    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            BeyondTheLineScriptBubble(text: quiz.answerText, type: .answer)
                .background(
                    GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                DispatchQueue.main.async {
                                    bubbleMaxWidth = geo.size.width
                                    answerHeight = geo.size.height
                                }
                            }
                        
                    }
                )
                .frame(maxWidth: bubbleMaxWidth)
                .zIndex(1)
            
            if quiz.isFeedbackVisible {
                BeyondTheLineScriptBubble(text: quiz.feedbackText, type: .feedback)
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    DispatchQueue.main.async {
                                        feedbackHeight += geo.size.height
                                    }
                                }
                                .onDisappear {
                                    DispatchQueue.main.async {
                                        feedbackHeight = 0
                                    }
                                }
                        }
                    )
                    .frame(width: bubbleMaxWidth)
                    .offset(y: -12)
            }
        }
    }
}
