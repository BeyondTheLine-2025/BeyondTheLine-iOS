//
//  LastQuizProgressView.swift
//  BeyondTheLine-iOS
//
//  Created by 조유진 on 6/17/25.
//

import SwiftUI

struct LastQuizProgressView: View {
    @ObservedObject var viewModel: LastQuizViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 14) {
            BeyondTheLineNavigationBar(
                leadingType: .close(action: {}),
                centerType: .title(title: "마무리 퀴즈")
            )
            
            BeyondTheLineProgressIndicator(progress: .constant(viewModel.progress))
                .padding(.horizontal, 20)
                .padding(.bottom, 12)
        }
        .padding(.bottom, 40)
    }
}
