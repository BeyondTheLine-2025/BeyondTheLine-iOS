//
//  SummaryFeedbackView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/22/25.
//

import SwiftUI

struct SummaryFeedbackView: View {
    let feedbacks: [String]

    var body: some View {
        VStack(spacing: 16) {
            Text("전체 피드백")
                .font(.title2)
                .foregroundColor(.btlBlue40Heavy)
                .multilineTextAlignment(.center)
            
            ForEach(Array(feedbacks.enumerated()), id: \.element) { index, feedback in
                HStack(alignment: .top) {
                    Image(systemName: "\(index + 1).circle.fill")
                        .foregroundColor(.btlBlue40Heavy)
                    Text(feedback)
                        .font(.caption1)
                        .foregroundColor(.btlGray15SemiNormal)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 16)
        .background(.btlBlue80)
        .cornerRadius(16)
        .padding(.top, 52)
        .padding(.bottom, 140)
        .padding(.horizontal, 18)
    }
}
