//
//  SummaryScriptView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SummaryScriptView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: SummaryScriptViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SummaryScriptView(viewModel: SummaryScriptViewModel())
}
