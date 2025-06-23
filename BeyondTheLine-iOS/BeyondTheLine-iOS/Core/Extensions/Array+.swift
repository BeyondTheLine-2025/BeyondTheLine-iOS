//
//  Array+.swift
//  BeyondTheLine-iOS
//
//  Created by 배현진 on 6/23/25.
//

extension Array {
    /// 인덱스 범위를 벗어나도 앱이 크래시 나지 않도록 nil  처리
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
