//
//  SummaryBackgroundView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/22/25.
//

import SwiftUI

struct SummaryBackgroundView: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.btlWhite.opacity(0.0), .btlWhite.opacity(0.95)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: UIScreen.main.bounds.width, height: 108)
            .cornerRadius(20)
            .allowsHitTesting(false)
    }
}
