//
//  BeyondTheLineSpeechBubbleType.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/21/25.
//

import SwiftUI

enum SpeechBubbleType {
    case black, blue
    
    var bubbleImage: Image {
        switch self {
        case .black: Image(.speechBubbleBlack)
        case .blue: Image(.speechBubbleBlue)
        }
    }
    
    var bubbleTitleColor: Color {
        switch self {
        case .black: .btlGray10Normal
        case .blue: .btlBlue40Heavy
        }
    }
}
