//
//  BeyondTheLineQuizAlert.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct BeyondTheLineQuizAlert: View {
    let question: String
    let options: [String]
    @Binding var disabledIndices: [Int]
    let onSelect: (Int) -> Void

    var body: some View {
        ZStack {
            Color.btlBlack.opacity(0.4)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    Image(.icnQuizMark)
                    
                    Text(question)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.btlGray10Normal)
                }

                VStack(spacing: 16) {
                    ForEach(options.indices, id: \.self) { index in
                        BeyondTheLineSimualtorAlertButton(
                            title: options[index],
                            buttonState: !disabledIndices.contains(index) ? .basic : .disabled,
                            action: { onSelect(index) }
                        )
                    }
                }
            }
            .padding(.top, 24)
            .padding(.bottom, 28)
            .padding(.horizontal, 20)
            .background(Color.btlWhite)
            .cornerRadius(15)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    BeyondTheLineQuizAlert(
        question: "어떻게 답하는게 좋을까요?",
        options: ["잠깐만요, 너무 많아서 잘 모르겠는데요?", "우유만 두유로 바꾸면 되는 거죠?", "아이스 바닐라라떼에 샷 2번, 시럽은 빼고,\n우유는 두유로, 얼음은 적게 맞으실까요?"],
        disabledIndices: .constant([]),
        onSelect: { _ in }
    )
}
