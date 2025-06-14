//
//  SelectBackgroundView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SelectBackgroundView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: SelectBackgroundViewModel
    
    var body: some View {
        Text("SelectBackgroundView")
    }
}

#Preview {
    SelectBackgroundView(viewModel: SelectBackgroundViewModel())
}
