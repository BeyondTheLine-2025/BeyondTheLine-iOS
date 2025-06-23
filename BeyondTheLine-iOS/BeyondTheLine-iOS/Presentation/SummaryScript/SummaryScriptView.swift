//
//  SummaryScriptView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SummaryScriptView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: SummaryScriptViewModel
    
    private var bottomPadding: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .first { $0.isKeyWindow }?
            .safeAreaInsets.bottom ?? 0
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            SummaryScriptSubView(
                quizzes: $viewModel.quizzes,
                customerIntro: viewModel.customerIntro,
                feedbacks: viewModel.feedbacks,
                onToggleFeedback: viewModel.toggleFeedback(for:)
            )
            
            SummaryBackgroundView()
            
            BeyondTheLineButton(title: "학습 완료", buttonState: .abled, action: {
                viewModel.selectFinish(coordinator: coordinator, context: viewContext)
            })
                .padding(.bottom, bottomPadding)
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            viewModel.fetchSimulationData(context: viewContext)
        }
    }
}

#Preview {
    SummaryScriptView(viewModel: SummaryScriptViewModel())
}
