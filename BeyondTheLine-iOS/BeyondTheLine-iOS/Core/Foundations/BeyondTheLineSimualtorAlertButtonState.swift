//
//  BeyondTheLineSimualtorAlertButtonState.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/16/25.
//

import SwiftUI

enum BeyondTheLineSimualtorAlertButtonState {
    case basic
    case pressed
    case disabled
    
    var backgroundColor: Color {
        switch self {
        case .basic:
            return .btlBlue85
        case .pressed:
            return .btlBlue75
        case .disabled:
            return .btlGray80
        }
    }
    
    var titleColor: Color {
        switch self {
        case .basic:
            return .btlGray30LabelNeutral
        case .pressed:
            return .btlBlue40Heavy
        case .disabled:
            return .btlGray45LabelAssistive1
        }
    }
}
