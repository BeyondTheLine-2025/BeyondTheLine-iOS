//
//  BridgeView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct BridgeView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: BridgeViewModel
    
    var body: some View {
        VStack {
            BeyondTheLineNavigationBar(
                leadingType: .close(action: {}),
                centerType: .none)
            
            Spacer()
            
            BridgeContentView(content: viewModel.content)
            
            BeyondTheLineButton(
                title: "확인",
                buttonState: .abled,
                action: {})
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    BridgeView(viewModel: BridgeViewModel(step: .finishQuiz))
}
