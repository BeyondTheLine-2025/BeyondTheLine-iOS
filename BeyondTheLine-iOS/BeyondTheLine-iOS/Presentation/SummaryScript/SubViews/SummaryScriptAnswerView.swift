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
                answerHeight: $answerHeight
            )
            .padding(.bottom, 12)
            .alignmentGuide(VerticalAlignment.center) { dimension in
                dimension[.top] + (answerHeight / 2)
            }
        }
    }
}
