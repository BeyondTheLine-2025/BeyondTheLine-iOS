//
//  SelectCustomerView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SelectCustomerView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: SelectCustomerViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            BeyondTheLineNavigationBar(
                leadingType: .back(action: {
                    coordinator.pop()
                }),
                centerType: .title(title: "상황 선택")
            )

            SituationBannerView(situation: viewModel.situation)

            if let model = viewModel.selectedSituationModel {
                SelectCustomerSubView(customers: model.customers) { customer in
                    viewModel.selectCustomer(customer, coordinator: coordinator)
                }
            }
        }
        .onAppear {
            viewModel.fetchSituations(context: viewContext)
        }
        .background(.btlGray90)
        .toolbar(.hidden, for: .navigationBar)
    }
}
