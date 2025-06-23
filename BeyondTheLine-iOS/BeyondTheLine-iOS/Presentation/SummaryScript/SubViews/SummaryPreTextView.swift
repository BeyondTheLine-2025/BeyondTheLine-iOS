//
//  SummaryPreTextView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/22/25.
//

import SwiftUI

struct SummaryPreTextView: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.body1)
            .foregroundStyle(.btlGray45LabelAssistive1)
            .multilineTextAlignment(.center)
            .padding(.top, 14)
            .padding(.bottom, 30)
    }
}
