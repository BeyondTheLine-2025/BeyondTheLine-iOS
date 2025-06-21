//
//  CustomerCellView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/19/25.
//

import SwiftUI

struct CustomerCellView: View {
    var customer: CustomerModel
    var onSelect: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            CustomerCellContentView(customer: customer)
            Spacer()
            Button {
                onSelect()
            } label: {
                Image(.icnPlayButton)
                    .foregroundColor(.btlBlue40Heavy)
            }
        }
        .padding()
        .background(.btlWhite)
        .cornerRadius(12)
    }
}
