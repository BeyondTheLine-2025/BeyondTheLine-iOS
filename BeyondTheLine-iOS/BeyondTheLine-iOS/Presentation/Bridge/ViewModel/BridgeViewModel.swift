//
//  BridgeViewModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

final class BridgeViewModel: ObservableObject {
    let content: BridgeContent

    init(step: BridgeStep) {
        self.content = step.content
    }
}
