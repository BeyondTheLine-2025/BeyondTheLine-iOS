//
//  BeyondTheLineBottomSheet.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

struct BeyondTheLineBottomSheet: View {
    private let sheetType: BeyondTheLineBottomSheetType
    private let description: String
    private let buttonTitle: String
    private let onTapButton: () -> Void
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var offsetY: CGFloat = 0
    
    init(
        sheetType: BeyondTheLineBottomSheetType,
        desctiption: String,
        buttonTitle: String,
        onTapButton: @escaping () -> Void
    ) {
        self.sheetType = sheetType
        self.description = desctiption
        self.buttonTitle = buttonTitle
        self.onTapButton = onTapButton
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                }
                
                HStack(spacing: 8) {
                    Image(systemName: sheetType.iconName)
                        .foregroundColor(sheetType.iconColor)
                    Text(sheetType.title)
                        .font(.title3.bold())
                        .foregroundColor(sheetType.textColor)
                }
                
                Text(description)
                    .font(.body)
                    .foregroundColor(sheetType.textColor)
                
            }
            .padding(24)
            .background(sheetType.backgroundColor)
            .offset(y: offsetY + dragOffset.height)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        if value.translation.height > 0 {
                            state = value.translation
                        }
                    }
                    .onEnded { value in
                        if value.translation.height > 100 {
                        }
                    }
            )
            .animation(.easeInOut, value: dragOffset.height)
        }
        .background(
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {}
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    BeyondTheLineBottomSheet(sheetType: .correct, desctiption: "어쩔", buttonTitle: "확인", onTapButton: {})
}

#Preview {
    BeyondTheLineBottomSheet(sheetType: .incorrect, desctiption: "어쩔", buttonTitle: "확인", onTapButton: {})
}
