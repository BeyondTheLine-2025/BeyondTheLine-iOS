//
//  SelectCustomerSubView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SelectCustomerSubView: View {
    var customers: [CustomerModel]
    var onSelect: (CustomerModel) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(customers) { customer in
                    CustomerCellView(customer: customer) {
                        onSelect(customer)
                    }
                }
            }
            .padding(.horizontal, 18)
        }
    }
}
