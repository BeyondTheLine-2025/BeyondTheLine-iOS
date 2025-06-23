//
//  BridgeImageView.swift
//  BeyondTheLine-iOS
//
//  Created by 조유진 on 6/24/25.
//

import SwiftUI

struct BridgeImageView: View {
    let content: BridgeContent
    
    var body: some View {
        VStack {
            if content.isLottie {
                BeyondTheLineLottieView(imageName: content.imageName)
                    .frame(width: 220, height: 220)
            } else {
                Image(content.imageName)
                    .resizable()
                    .frame(width: 190, height: 220)
            }
        }
        .padding(.bottom, 22)
    }
}
