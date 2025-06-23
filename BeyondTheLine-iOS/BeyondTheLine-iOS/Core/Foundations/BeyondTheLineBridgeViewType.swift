//
//  BeyondTheLineBridgeViewType.swift
//  BeyondTheLine-iOS
//
//  Created by 조유진 on 6/23/25.
//

import Foundation

struct BridgeContent {
    let imageName: String
    let isLottie: Bool
    let title: String
    let description: String
    let guide: String
}

enum BridgeStep {
    case finishSimulator
    case finishQuiz
    
    var content: BridgeContent {
        switch self {
        case .finishSimulator:
            return BridgeContent(
                imageName: "bridge_finishSimulation",
                isLottie: true,
                title: "여기까지 잘 왔어요!",
                description: "이런 상황을 잘 대처할 수 있다면,\n어떤 손님과도 좋은 관계를 만들 수 있어요.",
                guide: "이제 한걸음 더 나아가 볼까요?"
            )
        case .finishQuiz:
            return BridgeContent(
                imageName: "bridge_finishQuiz",
                isLottie: false,
                title: "잘해냈어요!",
                description: "반복 학습을 진행한다면\n더 원활하게 업무를 해낼 수 있을거에요!",
                guide: "마지막으로 전체 내용을 복습해볼까요?"
            )
        }
    }
}
