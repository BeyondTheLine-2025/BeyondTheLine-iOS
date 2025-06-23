//
//  BeyondTheLineLottieView.swift
//  BeyondTheLine-iOS
//
//  Created by 조유진 on 6/24/25.
//

import SwiftUI
import Lottie

// UIViewRepresentable for Lottie Animation
struct BeyondTheLineLottieView: UIViewRepresentable {
    let imageName: String
    let loopMode: LottieLoopMode

    init(imageName: String, loopMode: LottieLoopMode = .loop) {
        self.imageName = imageName
        self.loopMode = loopMode
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: imageName)
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // No update needed
    }
}
