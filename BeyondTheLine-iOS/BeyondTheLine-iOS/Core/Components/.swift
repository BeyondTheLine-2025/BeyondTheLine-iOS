//
//  BeyondTheLineSpeechBubble.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct BeyondTheLineSpeechBubble: View {
    let text: String
    let textColor: Color
    let backgroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat

    var body: some View {
        Text(text)
            .font(.title3.bold())
            .foregroundColor(textColor)
            .padding()
            .background(
                SpeechBubbleShape()
                    .fill(backgroundColor)
            )
            .overlay(
                SpeechBubbleShape()
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 24)
    }
}

struct SpeechBubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let cornerRadius: CGFloat = 16
        let tailWidth: CGFloat = 20
        let tailHeight: CGFloat = 10
        
        var path = Path()

        // 상단 RoundedRectangle
        let bubbleRect = CGRect(
            x: 0,
            y: 0,
            width: rect.width,
            height: rect.height - tailHeight
        )
        path.addRoundedRect(in: bubbleRect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))

        // 아래 꼬리
        let tailCenterX = rect.midX
        path.move(to: CGPoint(x: tailCenterX - tailWidth / 2, y: rect.height - tailHeight))
        path.addLine(to: CGPoint(x: tailCenterX, y: rect.height))
        path.addLine(to: CGPoint(x: tailCenterX + tailWidth / 2, y: rect.height - tailHeight))
        path.closeSubpath()

        return path
    }
}

#Preview {
    BeyondTheLineSpeechBubble(
                    text: "말풍선",
                    textColor: .black,
                    backgroundColor: .white,
                    borderColor: .black.opacity(0.7),
                    borderWidth: 2
                )
}
