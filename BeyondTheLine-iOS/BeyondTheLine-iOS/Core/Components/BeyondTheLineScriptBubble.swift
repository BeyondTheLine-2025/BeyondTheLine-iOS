//
//  BeyondTheLineScriptBubble.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct BeyondTheLineScriptBubble: View {
    let text: String
    let type: BeyondTheLineScriptBubbleState
    var isMeasuring: Bool = false
    
    var body: some View {
        HStack {
            Text(text.forceCharWrapping)
                .padding(type.InsetPadding)
                .font(.body1)
                .foregroundStyle(type.foregroundColor)
                .background(type.backgroundColor)
                .clipShape(UnevenRoundedRectangle(cornerRadii: type.cornerRadii))
                .multilineTextAlignment(.leading)
                .padding(type.framePadding)
        }
    }
}
extension String {
    /// forceCharWrapping - 줄바꿈을 단어가 아닌 글자 기준으로 변경하기 위해 사용
    var forceCharWrapping: Self {
        self.map({ String($0) }).joined(separator: "\u{200B}") // 200B: 가로폭 없는 공백문자
    }
}

#Preview {
    BeyondTheLineScriptBubble(text: "테스트", type: .answer)
    BeyondTheLineScriptBubble(text: "테스트", type: .customer)
    BeyondTheLineScriptBubble(text: "테스트", type: .feedback)
}
