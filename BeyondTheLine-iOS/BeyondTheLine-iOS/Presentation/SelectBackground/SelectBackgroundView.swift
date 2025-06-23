//
//  SelectBackgroundView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SelectBackgroundView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: SelectBackgroundViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 26) {
                BackgroundHeaderView()
                
                SelectBackgroundSubView(
                    backgrounds: viewModel.backgrounds,
                    onSelect: { situation in
                        viewModel.selectBackground(situation, coordinator: coordinator)
                    }
                )
            }
        }
        .onAppear {
            viewModel.fetchSituations(context: viewContext)
        }
        .padding(.horizontal, 18)
        .padding(.top, 1)
        .background(.btlGray90)
    }
}

#Preview {
    SelectBackgroundView(viewModel: SelectBackgroundViewModel())
}
