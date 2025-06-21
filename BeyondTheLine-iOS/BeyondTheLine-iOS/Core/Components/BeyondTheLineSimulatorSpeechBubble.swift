//
//  BeyondTheLineSimulatorSpeechBubble.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct BeyondTheLineSimulatorSpeechBubble: View {
    var speechBubbleType: SpeechBubbleType
    
    var body: some View {
        speechBubbleType.bubbleImage
            .resizable()
            .scaledToFit()
            .overlay {
                Text("아이스 바닐라라떼에 샷 2번만 넣어주시고요.")
                    .font(.subTitle)
                    .foregroundStyle(speechBubbleType.bubbleTitleColor)
                    .padding(.bottom, 20)
            }
            .padding(.horizontal, 16)
    }
}

#Preview {
    BeyondTheLineSimulatorSpeechBubble(speechBubbleType: .black)
    BeyondTheLineSimulatorSpeechBubble(speechBubbleType: .blue)
}
