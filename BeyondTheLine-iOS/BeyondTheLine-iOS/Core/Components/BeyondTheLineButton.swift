//
//  BeyondTheLineButton.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

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
                .font(.subTitle)
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundStyle(buttonState.titleColor)
                .background(buttonState.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(buttonState.borderColor, lineWidth: 1)
                )
        }
        .padding(.horizontal, 18)
        .disabled(buttonState == .disabled)
    }
}

#Preview {
    BeyondTheLineButton(title: "확인", buttonState: .abled, action: {})
    BeyondTheLineButton(title: "확인", buttonState: .disabled, action: {})
    BeyondTheLineButton(title: "확인", buttonState: .white, action: {})
    BeyondTheLineButton(title: "확인", buttonState: .correct, action: {})
    BeyondTheLineButton(title: "확인", buttonState: .incorrect, action: {})
}
