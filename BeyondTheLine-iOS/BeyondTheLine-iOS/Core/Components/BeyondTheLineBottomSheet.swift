//
//  BeyondTheLineBottomSheet.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

struct BeyondTheLineBottomSheet: View {
    private let sheetType: BeyondTheLineBottomSheetType
    private let description: String?
    private let buttonTitle: String
    private let onTapButton: () -> Void
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var offsetY: CGFloat = 0
    
    init(
        sheetType: BeyondTheLineBottomSheetType,
        description: String? = nil,
        buttonTitle: String,
        onTapButton: @escaping () -> Void
    ) {
        self.sheetType = sheetType
        self.description = description
        self.buttonTitle = buttonTitle
        self.onTapButton = onTapButton
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                Group {
                    HStack { Spacer() }
                    
                    HStack(spacing: 4) {
                        Image(systemName: sheetType.iconName)
                            .foregroundColor(sheetType.iconColor)
                        Text(sheetType.title)
                            .font(.title2)
                            .foregroundColor(sheetType.textColor)
                    }
                    
                    if let desc = description, !desc.isEmpty {
                        Text(desc)
                            .font(.body1)
                            .lineSpacing(4)
                            .foregroundColor(sheetType.textColor)
                            .padding(.bottom, 12)
                    } else {
                        Spacer()
                            .frame(height: 20)
                    }
                }
                .padding(.horizontal, 18)
                
                BeyondTheLineButton(
                    title: buttonTitle,
                    buttonState: sheetType == .correct ? .correct : .incorrect,
                    action: { onTapButton() }
                )
            }
            .padding(.vertical, 12)
            .edgesIgnoringSafeArea(.bottom)
            .background(sheetType.backgroundColor)
            .offset(y: offsetY + dragOffset.height)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        if value.translation.height > 0 {
                            state = value.translation
                        }
                    }
            )
            .animation(.easeInOut, value: dragOffset.height)
        }
    }
}

#Preview {
    BeyondTheLineBottomSheet(sheetType: .correct, description: "이런 반응은 고객에게 부담을 줄 수 있어요.\n복잡한 주문일수록 정리해서 복창하는 것이 좋아요.", buttonTitle: "확인", onTapButton: {})
}

#Preview {
    BeyondTheLineBottomSheet(sheetType: .incorrect, description: "고객의 선택을 제한하는 말투는 지양해야 해요.", buttonTitle: "확인", onTapButton: {})
}
