//
//  BeyondTheLineNavigationBar.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct BeyondTheLineNavigationBar: View {
    private let leadingType: BeyondTheLineNavigationBarLeadingType
    private let centerType: BeyondTheLineNavigationBarCenterType
    
    public init(
        leadingType: BeyondTheLineNavigationBarLeadingType,
        centerType: BeyondTheLineNavigationBarCenterType
    ) {
        self.leadingType = leadingType
        self.centerType = centerType
    }
    
    var body: some View {
         VStack(spacing: 0) {
             HStack {
                 navigationLeadingView()
                 Spacer()
                 navigationCenterView()
                 Spacer()
                 if !centerType.isProgress {
                     Spacer().frame(width: 24).opacity(0)
                 }
             }
             .padding(.horizontal, 18)
             .padding(.vertical, 12)
             .background(Color.white)
         }
     }

     // MARK: - Leading View
    
     @ViewBuilder
     private func navigationLeadingView() -> some View {
         switch leadingType {
         case .back(let action):
             Button(action: action) {
                 Image(systemName: SymbolLiterals.navigationBackMark)
                     .font(.icon)
                     .foregroundColor(.btlGray10Normal)
             }
             .frame(width: 24, height: 24)
         case .close(let action):
             Button(action: action) {
                 Image(systemName: SymbolLiterals.navigationXMark)
                     .font(.icon)
                     .foregroundColor(.btlGray10Normal)
             }
             .frame(width: 24, height: 24)
         case .none:
             Spacer().frame(width: 24).opacity(0)
         }
     }

     // MARK: - Center Title View
    
     @ViewBuilder
     private func navigationCenterView() -> some View {
         switch centerType {
         case .title(let text):
             Text(text)
                 .font(.subTitle)
                 .foregroundColor(.btlGray15SemiNormal)
         case .progress:
             if case let .progress(binding) = centerType {
                 BeyondTheLineProgressIndicator(progress: binding)
                     .padding(.leading, 14)
             }
         case .none:
             EmptyView()
         }
     }
}

#Preview {
    BeyondTheLineNavigationBar(leadingType: .back(action: {}), centerType: .title(title: "어쩔"))
    BeyondTheLineNavigationBar(leadingType: .close(action: {}), centerType: .progress(.constant(1.0)))
    BeyondTheLineNavigationBar(leadingType: .close(action: {}), centerType: .none)
    BeyondTheLineNavigationBar(leadingType: .back(action: {}), centerType: .none)
    BeyondTheLineNavigationBar(leadingType: .none, centerType: .title(title: "어쩔"))
}
