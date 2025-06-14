//
//  BeyondTheLineSelectedButton.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

struct BeyondTheLineSelectedButton: View {
    private let title: String
    private let buttonState: BeyondTheLineSelectedButtonState
    private let action: () -> Void
    
    init(
        title: String,
        buttonState: BeyondTheLineSelectedButtonState,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.buttonState = buttonState
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(buttonState.titleFont)
                    .foregroundStyle(buttonState.titleColor)
                Spacer()
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 18)
            .background(buttonState.backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(buttonState.strokeColor, lineWidth: 2)
            )
            .cornerRadius(14)
        }
        .disabled(buttonState == .disabled)
    }
}

#Preview {
    VStack {
        BeyondTheLineSelectedButton(title: "어쩌구 저쩌구", buttonState: .basic, action: {})
        BeyondTheLineSelectedButton(title: "어쩌구 저쩌구", buttonState: .pressed, action: {})
        BeyondTheLineSelectedButton(title: "어쩌구 저쩌구", buttonState: .disabled, action: {})
        BeyondTheLineSelectedButton(title: "어쩌구 저쩌구", buttonState: .correct, action: {})
        BeyondTheLineSelectedButton(title: "어쩌구 저쩌구", buttonState: .incorrect, action: {})

    }
    .padding()
}
