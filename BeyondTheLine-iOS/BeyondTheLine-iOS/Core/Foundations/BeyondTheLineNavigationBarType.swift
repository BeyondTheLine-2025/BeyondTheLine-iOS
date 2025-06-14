//
//  BeyondTheLineNavigationBarType.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

enum BeyondTheLineNavigationBarLeadingType {
    case back(action: () -> Void)
    case close(action: () -> Void)
    case none
}

enum BeyondTheLineNavigationBarCenterType {
    case title(title: String)
    case progress(Binding<CGFloat>)
    case none
}

extension BeyondTheLineNavigationBarCenterType {
    var isProgress: Bool {
        if case .progress = self { return true }
        return false
    }
}
