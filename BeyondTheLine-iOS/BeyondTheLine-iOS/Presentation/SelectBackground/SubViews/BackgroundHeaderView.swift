//
//  HeaderView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/19/25.
//

import SwiftUI

struct BackgroundHeaderView: View {
    var body: some View {
        Text("연습하고 싶은\n배경을 선택해주세요")
            .font(.title1)
            .foregroundStyle(.btlGray10Normal)
            .lineSpacing(4)
            .padding(.top, 49)
    }
}
