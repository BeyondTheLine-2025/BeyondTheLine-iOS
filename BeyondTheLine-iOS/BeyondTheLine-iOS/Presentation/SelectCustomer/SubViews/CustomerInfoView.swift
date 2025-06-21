//
//  CustomerInfoView.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/19/25.
//

import SwiftUI

struct CustomerInfoView: View {
    var customer: CustomerModel
    
    var body: some View {
        HStack {
            Text(customer.name)
                .font(.title2)
                .foregroundColor(.btlGray05Strong)
            Text("\(customer.age)세")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
