//
//  BeyondTheLineProgressIndicator.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

struct BeyondTheLineProgressIndicator: View {
    @Binding var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.ultraThinMaterial)
                    .fill(Color.btlBlue85)
                    .frame(height: 12)
                    .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 2)

                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.btlBlue)
                    .frame(width: max(0, min(progress, 1)) * geometry.size.width, height: 12)
                    .animation(.easeInOut(duration: 0.3), value: progress)
            }
        }
        .frame(height: 12)
    }
}
