//
//  BeyondTheLineScriptBubbleState.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/22/25.
//

import SwiftUI

enum BeyondTheLineScriptBubbleState {
    case customer
    case answer
    case feedback
    
    var foregroundColor: Color {
        switch self {
        case .customer, .answer: return .btlGray10Normal
        case .feedback: return .btlGreen35
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .customer: return .btlBlue80
        case .answer: return .btlWhite
        case .feedback: return .btlGreen90Light
        }
    }
    
    var alignment: Alignment {
        switch self {
        case .customer: return .leading
        case .answer, .feedback: return .trailing
        }
    }
    
    var cornerRadii: RectangleCornerRadii {
        switch self {
        case .customer:
            return .init(topLeading: 0, bottomLeading: 14, bottomTrailing: 14, topTrailing: 14)
        case .answer:
            return .init(topLeading: 14, bottomLeading: 14, bottomTrailing: 14, topTrailing: 0)
        case .feedback:
            return .init(topLeading: 0, bottomLeading: 14, bottomTrailing: 14, topTrailing: 0)
        }
    }
    
    var framePadding: EdgeInsets {
        switch self {
        case .customer:
            return .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        case .answer, .feedback:
            return .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        }
    }
    
    var InsetPadding: EdgeInsets {
        switch self {
        case .customer, .answer:
            return .init(top: 12, leading: 12, bottom: 12, trailing: 12)
        case .feedback:
            return .init(top: 24, leading: 12, bottom: 12, trailing: 12)
        }
    }
}
