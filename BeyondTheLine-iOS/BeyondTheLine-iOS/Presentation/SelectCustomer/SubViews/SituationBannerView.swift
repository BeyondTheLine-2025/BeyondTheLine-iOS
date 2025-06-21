//
//  SituationBannerView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/19/25.
//

import SwiftUI

struct SituationBannerView: View {
    let situation: SituationModel?

    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(.btlGray80)
                .frame(width: UIScreen.main.bounds.width, height: 50)

            HStack {
                Text("선택된 배경")
                    .font(.caption1)
                    .foregroundColor(.btlGray15SemiNormal)
                Spacer()
                Text(situation?.title ?? "기타")
                    .font(.body1)
                    .foregroundColor(.btlGray15SemiNormal)
            }
            .padding()
        }
        .padding(.bottom, 47)
    }
}
