//
//  LearningInfoView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/19/25.
//

import SwiftUI

struct LearningInfoView: View {
    var customer: CustomerModel
    
    var body: some View {
        HStack(spacing: 2) {
            Text("학습 횟수: ")
                .font(.body1)
                .foregroundColor(.btlBlue40Heavy)
            Text("\(customer.learningCount)회")
                .font(.body2)
                .foregroundColor(.btlBlue40Heavy)
        }
    }
}
