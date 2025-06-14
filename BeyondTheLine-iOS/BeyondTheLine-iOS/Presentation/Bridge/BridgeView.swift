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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BridgeView(viewModel: BridgeViewModel())
}
