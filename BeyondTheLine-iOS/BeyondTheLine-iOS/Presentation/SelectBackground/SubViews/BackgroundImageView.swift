//
//  BackgroundImageView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/24/25.
//

import SwiftUI

struct BackgroundImageView: View {
    var imageName: String
    
    var body: some View {
        Image("\(imageName)")
            .cornerRadius(12)
            .frame(height: 180)
            .padding(.bottom, 14)
    }
}
