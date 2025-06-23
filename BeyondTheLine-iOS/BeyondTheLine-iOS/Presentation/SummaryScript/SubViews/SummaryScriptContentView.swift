//
//  SummaryScriptContentView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/22/25.
//

import SwiftUI

struct SummaryScriptContentView: View {
    let quiz: SummaryScriptModel
    let toggleFeedback: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            // 상황 전개 + 손님 요청
            if quiz.isWarning {
                SummaryPreTextView(text: quiz.customerText)
            } else if !quiz.customerText.isEmpty {
                BeyondTheLineScriptBubble(text: quiz.customerText, type: .customer)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // 답변 + 버튼 + 피드백
            SummaryScriptAnswerView(quiz: quiz, toggleFeedback: toggleFeedback)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            // 정답 텍스트
            BeyondTheLineScriptBubble(text: quiz.correctAnswerText, type: .customer)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 18)
    }
}
