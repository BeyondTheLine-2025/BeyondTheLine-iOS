//
//  BeyondTheLineButtonState.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

enum BeyondTheLineButtonState {
    case white
    case abled
    case disabled
    case correct
    case incorrect
    
    var backgroundColor: Color {
        switch self {
        case .white:
            return .btlWhite
        case .abled:
            return .btlBlue
        case .disabled:
            return .btlGray2
        case .correct:
            return .btlGreen50Normal
        case .incorrect:
            return .btlPink50Normal
        }
    }
    
    var titleColor: Color {
        switch self {
        case .abled, .correct, .incorrect:
            return .btlWhite
        case .disabled:
            return .btlGray1
        case .white:
            return .btlBlue
        }
    }
    
    var borderColor: Color {
        switch self {
        case .white:
            return .btlBlue
        case .abled, .disabled, .correct, .incorrect:
            return .clear
        }
    }
}
