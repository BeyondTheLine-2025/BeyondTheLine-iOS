//
//  SimualtorBackground.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/21/25.
//

import SwiftUI

struct SimualtorBackground: View {
    var body: some View {
        ZStack {
            Image(.cafeBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Image(.cafeCounter)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Image(.customerMinjiSmile)
                .resizable()
                .scaledToFit()
                .frame(width: 288)
                .padding(.top, 85)
        }
    }
}

#Preview {
    SimualtorBackground()
}
