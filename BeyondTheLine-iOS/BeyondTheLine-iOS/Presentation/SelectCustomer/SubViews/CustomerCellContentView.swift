//
//  CustomerCellInfoView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/19/25.
//

import SwiftUI

struct CustomerCellContentView: View {
    var customer: CustomerModel
    
    var body: some View {
        Image(.customerCafe1)
            .frame(width: 80, height: 80)
            .cornerRadius(8)
        
        VStack(alignment: .leading, spacing: 8) {
            CustomerInfoView(customer: customer)
            
            LearningInfoView(customer: customer)
        }
    }
}
