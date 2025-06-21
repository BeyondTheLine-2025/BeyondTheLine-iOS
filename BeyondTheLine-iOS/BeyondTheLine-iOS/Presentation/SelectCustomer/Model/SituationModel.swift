//
//  SelectSituationModel.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/20/25.
//

import Foundation

struct SituationModel: Identifiable {
    private let situation: Situation
    private let fallbackID = UUID()

    init(situation: Situation) {
        self.situation = situation
    }

    var id: UUID { situation.id ?? fallbackID }
    var title: String { situation.title ?? "제목 없음" }
    var customers: [CustomerModel] {
        (situation.customers?.allObjects as? [Customer] ?? []).map {
            CustomerModel(customer: $0)
        }
    }
}
