//
//  BeyondTheLineBottomSheetModifier.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct BeyondTheLineBottomSheetModifier: ViewModifier {
    @Binding var isPresented: Bool
    let sheetType: BeyondTheLineBottomSheetType
    let description: String
    let buttonTitle: String
    let onTapButton: () -> Void

    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                BeyondTheLineBottomSheet(
                    sheetType: sheetType,
                    desctiption: description,
                    buttonTitle: buttonTitle
                ) {
                    withAnimation {
                        onTapButton()
                        isPresented = false
                    }
                }
                .transition(.move(edge: .bottom))
            }
        }
    }
}

extension View {
    func beyondTheLineBottomSheet(
        isPresented: Binding<Bool>,
        sheetType: BeyondTheLineBottomSheetType,
        description: String,
        buttonTitle: String,
        onTapButton: @escaping () -> Void
    ) -> some View {
        self.modifier(
            BeyondTheLineBottomSheetModifier(
                isPresented: isPresented,
                sheetType: sheetType,
                description: description,
                buttonTitle: buttonTitle,
                onTapButton: onTapButton
            )
        )
    }
}
