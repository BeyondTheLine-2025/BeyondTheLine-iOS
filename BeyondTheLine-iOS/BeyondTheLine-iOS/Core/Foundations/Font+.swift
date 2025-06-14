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
    case pretendardRegular = "Pretendard-Regular"
}

extension Font {
    static var largeTitle: Font = .custom(FontName.pretendardBold.rawValue, size: 32)
    static var title1: Font = .custom(FontName.pretendardBold.rawValue, size: 24)
    static var title2: Font = .custom(FontName.pretendardBold.rawValue, size: 20)
    static var subTitle: Font = .custom(FontName.pretendardBold.rawValue, size: 18)
    static var label1: Font = .custom(FontName.pretendardSemiBold.rawValue, size: 16)
    static var label2: Font = .custom(FontName.pretendardBold.rawValue, size: 16)
    static var body1: Font = .custom(FontName.pretendardRegular.rawValue, size: 16)
    static var body2: Font = .custom(FontName.pretendardBold.rawValue, size: 16)
    static var caption1: Font = .custom(FontName.pretendardRegular.rawValue, size: 14)
    static var icon: Font = .custom(FontName.pretendardSemiBold.rawValue, size: 16)
}
