//
//  BeyondTheLineSelectedButtonState.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

enum BeyondTheLineSelectedButtonState {
    case basic
    case pressed
    case disabled
    case correct
    case incorrect
    
    var backgroundColor: Color {
        switch self {
        case .basic:
            return .btlGray90
        case .pressed, .disabled:
            return .btlGray80
        case .correct:
            return .btlGreen90Light
        case .incorrect:
            return .btlPink90Light
        }
    }
    
    var titleColor: Color {
        switch self {
        case .basic:
            return .btlGray10Normal
        case .pressed:
            return .btlGray05Strong
        case .disabled:
            return .btlGray60Assitive
        case .correct:
            return .btlGreen40Strong
        case .incorrect:
            return .btlPink40Strong
        }
    }
    
    var titleFont: Font {
        switch self {
        case .basic, .pressed, .disabled:
            return .body1
        case .correct, .incorrect:
            return .label2
        }
    }
    
    var strokeColor: Color {
        switch self {
        case .basic, .pressed, .disabled:
            return .clear
        case .correct:
            return .btlGreen50Normal
        case .incorrect:
            return .btlPink50Normal
        }
    }
}
