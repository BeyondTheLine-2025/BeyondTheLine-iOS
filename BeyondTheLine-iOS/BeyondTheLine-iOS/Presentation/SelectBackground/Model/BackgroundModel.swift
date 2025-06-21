//
//  SelectBackgroundModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

struct BackgroundModel: Identifiable, Hashable {
    private let background: Background
    private let fallbackID = UUID()

    init(background: Background) {
        self.background = background
    }

    var id: UUID { background.id ?? fallbackID }
    var sortedSituations: [SituationModel] {
        (background.situations?.allObjects as? [Situation])?
            .compactMap { $0 }
            .sorted { ($0.title ?? "") < ($1.title ?? "") }
            .map { SituationModel(situation: $0) } ?? []
    }
}
