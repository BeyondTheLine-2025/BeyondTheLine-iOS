//
//  SelectBackgroundSubView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SelectBackgroundSubView: View {
    let backgrounds: [BackgroundModel]
    let onSelect: (SituationModel) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(backgrounds) { background in
                ForEach(background.sortedSituations) { situation in
                    BackgroundCellView(situation: situation) {
                        onSelect(situation)
                    }
                }
            }
        }
    }
}
