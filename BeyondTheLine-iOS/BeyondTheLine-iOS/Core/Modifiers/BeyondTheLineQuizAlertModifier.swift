//
//  BeyondTheLineQuizAlertModifier.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/16/25.
//

import SwiftUI

struct BeyondTheLineQuizAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    let question: String
    let options: [String]
    let onSelect: () -> Void

    func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                BeyondTheLineQuizAlert(
                    question: question,
                    options: options,
                    onSelect: {
                        onSelect()
                        isPresented = false
                    }
                )
                .transition(.opacity)
            }
        }
    }
}

extension View {
    func beyondTheLineQuizAlert(
        isPresented: Binding<Bool>,
        question: String,
        options: [String],
        onSelect: @escaping () -> Void
    ) -> some View {
        modifier(
            BeyondTheLineQuizAlertModifier(
                isPresented: isPresented,
                question: question,
                options: options,
                onSelect: onSelect
            )
        )
    }
}
