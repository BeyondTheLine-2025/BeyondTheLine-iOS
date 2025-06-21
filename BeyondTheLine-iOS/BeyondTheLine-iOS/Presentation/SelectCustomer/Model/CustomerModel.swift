//
//  SelectCustomerModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

struct CustomerModel: Identifiable {
    private let customer: Customer
    private let fallbackID = UUID()

    init(customer: Customer) {
        self.customer = customer
    }

    var id: UUID { customer.id ?? fallbackID }
    var name: String { customer.name ?? "" }
    var age: Int { Int(customer.age) }
    var learningCount: Int { Int(customer.learningCount) }
}
