//
//  SimulatorView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SimulatorView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: SimulatorViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SimulatorView(viewModel: SimulatorViewModel())
}
