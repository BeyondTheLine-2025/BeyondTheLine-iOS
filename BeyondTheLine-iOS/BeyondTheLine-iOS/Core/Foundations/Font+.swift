//
//  Font+.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/13/25.
//

import SwiftUI

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
}

extension Font {
    static func pretendardBold(size: CGFloat) -> Font {
        return .custom(FontName.pretendardBold.rawValue, size: size)
    }
    
    static func pretendardSemiBold(size: CGFloat) -> Font {
        return .custom(FontName.pretendardSemiBold.rawValue, size: size)
    }
    
    static func pretendardMedium(size: CGFloat) -> Font {
        return .custom(FontName.pretendardMedium.rawValue, size: size)
    }
    
    static func pretendardRegular(size: CGFloat) -> Font {
        return .custom(FontName.pretendardRegular.rawValue, size: size)
    }
}
