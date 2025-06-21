//
//  SimulationActionCustomer.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/21/25.
//

import SwiftUI
import AVFoundation

struct SimulationActionCustomer: View {
    @Binding var currentStep: Int
    
    @State private var player: AVAudioPlayer?
    @State private var playerDelegate: AVAudioPlayerDelegate? = nil
    @State private var currentImageIndex = 0
    @State private var timer: Timer?
    @State private var isPlayingSound = false
    
    private let images: [Image] = [
        Image(.customerMinjiSmile),
        Image(.customerMinjiTalk)
    ]
    let text: String
    
    var body: some View {
        ZStack {
            images[currentImageIndex]
                .resizable()
                .scaledToFit()
                .frame(width: 288)
                .padding(.top, 85)
            
            BeyondTheLineSimulatorSpeechBubble(speechBubbleType: .black, text: text)
                .padding(.bottom, 400)
        }
        .onChange(of: currentStep) { _, newStep in
            if newStep == 1 && !isPlayingSound {
                startPlayback(soundResource: SoundLiterals.customer1Take1)
            }
        }
    }
}

extension SimulationActionCustomer {
    func startPlayback(soundResource: String) {
        guard let url = Bundle.main.url(forResource: soundResource, withExtension: "wav") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            let delegateBridge = AVPlayerDelegateBridge(onFinish: stopPlayback)
            playerDelegate = delegateBridge
            player?.delegate = delegateBridge
            player?.play()
            isPlayingSound = true
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                currentImageIndex = (currentImageIndex + 1) % images.count
            }
            
        } catch {
            print("\(error)")
        }
    }
    
    func stopPlayback() {
        player?.stop()
        timer?.invalidate()
        timer = nil
        isPlayingSound = false
        currentImageIndex = 0
        playerDelegate = nil
    }
}

class AVPlayerDelegateBridge: NSObject, AVAudioPlayerDelegate {
    let onFinish: () -> Void
    
    init(onFinish: @escaping () -> Void) {
        self.onFinish = onFinish
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        onFinish()
    }
}
