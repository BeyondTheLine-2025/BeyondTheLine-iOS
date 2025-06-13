//
//  BeyondTheLineButton.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

// MARK: - Button State Enum

enum BeyondTheLineButtonState {
    case white
    case abled
    case disabled
    case success
    case wrong
    
    var backgroundColor: Color {
        switch self {
        case .white:
            return .btlWhite
        case .abled:
            return .btlBlue
        case .disabled:
            return .btlGray2
        case .success:
            return .btlGreen
        case .wrong:
            return .btlRed
        }
    }
    
    var titleColor: Color {
        switch self {
        case .abled, .success, .wrong:
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
        case .abled, .disabled, .success, .wrong:
            return .clear
        }
    }
}

// MARK: - Button View

struct BeyondTheLineButton: View {
    private let title: String
    private let buttonState: BeyondTheLineButtonState
    private let action: () -> Void
    
    init(
        title: String,
        buttonState: BeyondTheLineButtonState,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.buttonState = buttonState
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.pretendardSemiBold(size: 20))
                .padding(10)
                .frame(width: .infinity, height: 50)
                .foregroundStyle(buttonState.titleColor)
                .background(buttonState.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(buttonState.borderColor, lineWidth: 1)
                )
        }
        .disabled(buttonState == .disabled)
    }
}

#Preview {
    BeyondTheLineButton(title: "확인", buttonState: .abled, action: {})
    BeyondTheLineButton(title: "확인", buttonState: .disabled, action: {})
    BeyondTheLineButton(title: "확인", buttonState: .white, action: {})
    BeyondTheLineButton(title: "확인", buttonState: .success, action: {})
    BeyondTheLineButton(title: "확인", buttonState: .wrong, action: {})
}
