//
//  BeyondTheLineBottomSheetState.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

enum BeyondTheLineBottomSheetType {
    case correct
    case incorrect
    
    var iconName: String {
        switch self {
        case .correct:
            return SymbolLiterals.circleCheckmark
        case .incorrect:
            return SymbolLiterals.circleXMark
        }
    }
    
    var iconColor: Color {
        switch self {
        case .correct:
            return .btlGreen50Normal
        case .incorrect:
            return .btlPink50Normal
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .correct:
            return .btlGreen90Light
        case .incorrect:
            return .btlPink90Light
        }
    }
    
    var textColor: Color {
        switch self {
        case .correct:
            return .btlGreen40Strong
        case .incorrect:
            return .btlPink40Strong
        }
    }
    
    var title: String {
        switch self {
        case .correct:
            return "정답이에요!"
        case .incorrect:
            return "오답이에요!"
        }
    }
}
