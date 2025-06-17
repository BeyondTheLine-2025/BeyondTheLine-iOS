//
//  BeyondTheLineSimualtorAlertButton.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/16/25.
//

import SwiftUI

struct BeyondTheLineSimualtorAlertButton: View {
    private let title: String
    private let buttonState: BeyondTheLineSimualtorAlertButtonState
    private let action: () -> Void
    
    init(
        title: String,
        buttonState: BeyondTheLineSimualtorAlertButtonState,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.buttonState = buttonState
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .font(.label1)
                    .foregroundStyle(buttonState.titleColor)
                Spacer()
            }
            .padding(16)
            .background(buttonState.backgroundColor)
            .cornerRadius(12)
        }
        .disabled(buttonState == .disabled)
    }
}

#Preview {
    VStack(spacing: 20) {
        BeyondTheLineSimualtorAlertButton(title: "어쩔", buttonState: .basic, action: {})
        BeyondTheLineSimualtorAlertButton(title: "어쩔", buttonState: .disabled, action: {})
        BeyondTheLineSimualtorAlertButton(title: "어쩔", buttonState: .pressed, action: {})
    }
}
