//
//  BeyondTheLineSimulatorDialog.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/19/25.
//

import SwiftUI

struct BeyondTheLineSimulatorDialog: View {
    private let message: String
    private let isWarning: Bool
    
    init(
        message: String,
        isWarning: Bool = false
    ) {
        self.message = message
        self.isWarning = isWarning
    }
    
    var body: some View {
        VStack(spacing: 16) {
            if isWarning {
                Text("돌발 상황")
                    .font(.subTitle)
                    .foregroundStyle(.btlPink40Strong)
            }
            
            HStack {
                Spacer(minLength: 18)
                Text(message)
                    .font(.label2)
                    .foregroundStyle(.btlGray30LabelNeutral)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 18)
            }
            
        }
        .padding(.vertical, 16)
        .background(.btlWhite)
        .cornerRadius(16)
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .fill(.clear)
        )
    }
}

#Preview {
    ZStack {
        Color.btlBlack
        VStack {
            BeyondTheLineSimulatorDialog(message: "20대로 보이는 여성 손님이\n카페로 들어왔어요.")
            BeyondTheLineSimulatorDialog(message: "20대로 보이는 여성 손님이\n카페로 들어왔어요.", isWarning: true)
        }

    }
}
