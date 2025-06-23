//
//  BeyondTheLineQuizAlertModifier.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/16/25.
//

import SwiftUI

struct BeyondTheLineQuizAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    @Binding var disabledIndices: [Int]
    let question: String
    let options: [String]
    let onSelect: (Int) -> Void

    func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                BeyondTheLineQuizAlert(
                    question: question,
                    options: options,
                    disabledIndices: $disabledIndices,
                    onSelect: { selectIndex in
                        onSelect(selectIndex)
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
        disabledIndices: Binding<[Int]>,
        question: String,
        options: [String],
        onSelect: @escaping (Int) -> Void
    ) -> some View {
        modifier(
            BeyondTheLineQuizAlertModifier(
                isPresented: isPresented,
                disabledIndices: disabledIndices,
                question: question,
                options: options,
                onSelect: onSelect
            )
        )
    }
}
