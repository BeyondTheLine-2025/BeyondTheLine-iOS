//
//  BackgroundCellView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/19/25.
//

import SwiftUI

struct BackgroundCellView: View {
    var situation: SituationModel
    var onSelect: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            // TODO: - 배경 선택지 늘어나면 이미지 처리 개선
            if situation.title == "카페" {
                BackgroundImageView(imageName: "backgroundCafe")
            } else {
                BackgroundImageView(imageName: "backgroundStore")
            }

            Text("\(situation.title)")
                .font(.title2)
                .foregroundStyle(.btlGray10Normal)
                .padding(.bottom, 1)

            Text("상황 \(situation.customers.count)개")
                .font(.body1)
                .foregroundColor(.btlBlue40Heavy)
                .padding(.bottom, 16)

            BeyondTheLineButton(title: "배경 선택", buttonState: .abled, action: {
                onSelect()
            })
            .padding(.horizontal, -18)
        }
        .padding(16)
        .background(.btlWhite)
        .cornerRadius(18)
    }
}
