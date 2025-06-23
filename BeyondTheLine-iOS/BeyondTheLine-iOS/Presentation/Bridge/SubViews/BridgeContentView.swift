//
//  BridgeContentView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct BridgeContentView: View {
    let content: BridgeContent

    var body: some View {
        BridgeImageView(content: content)
        
        VStack(spacing: 10) {
            Text(content.title)
                .font(.title2)
                .foregroundStyle(.btlGray10Normal)
                .lineSpacing(4)
            
            Text(content.description)
                .font(.body1)
                .multilineTextAlignment(.center)
                .foregroundStyle(.btlGray30LabelNeutral)
        }
        .padding(.bottom, 198)
        
        Text(content.guide)
            .font(.body1)
            .multilineTextAlignment(.center)
            .foregroundStyle(.btlBlue)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.bottom, 20)
    }
}
