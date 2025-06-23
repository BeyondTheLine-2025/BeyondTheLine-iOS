//
//  BeyondTheLineAudioPlayer.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/22/25.
//

import AVFoundation
import Foundation
import SwiftUI

final class BeyondTheLineAudioPlayer: NSObject, ObservableObject {
    @Published var isPlayingSound: Bool = false
    private var player: AVAudioPlayer?
    private var timer: Timer?
    private var currentImageIndex = 0
    private var onFinish: (() -> Void)?
    
    var imageSwitchHandler: ((Int) -> Void)?
    
    func play(soundResource: String, completion: @escaping () -> Void) {
        guard let url = Bundle.main.url(forResource: soundResource, withExtension: "wav") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            onFinish = completion
            player?.play()
            isPlayingSound = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [weak self] _ in
                guard let self else { return }
                currentImageIndex = (currentImageIndex + 1) % 2
                imageSwitchHandler?(currentImageIndex)
            }
        } catch {
            print("❌ 사운드 재생 실패: \(error)")
        }
    }
    
    func stop() {
        player?.stop()
        timer?.invalidate()
        timer = nil
        isPlayingSound = false
        currentImageIndex = 0
        imageSwitchHandler?(0)
        onFinish?()
    }
}

/// Player의 재생이 끝났음을 감지하기 위한 AVAudioPlayerDelegate Extension
extension BeyondTheLineAudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stop()
    }
}
