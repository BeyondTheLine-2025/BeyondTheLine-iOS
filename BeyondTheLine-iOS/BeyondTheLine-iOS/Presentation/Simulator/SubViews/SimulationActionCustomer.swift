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
    @Binding var isAnswerCorrect: Bool
    @Binding var isShowBlackSpeechBubble: Bool
    @Binding var shouldPlayCustomerAnswerSound: Bool
    @Binding var correctAnswerText: String?
    
    @StateObject private var audioPlayer = BeyondTheLineAudioPlayer()
    @State private var currentImageIndex = 0
    @State private var showWarningDialog: Bool = false
    
    @Binding var currectReactionIndex: Int
    private let reactionResource: [String] = [
        SoundLiterals.customer1Take2,
        SoundLiterals.customer1Take3,
        SoundLiterals.customer1Take4
    ]
    
    let text: String
    let soundResource: String?
    let isWarning: Bool
    let onAudioFinished: () -> Void
    
    private let images: [Image] = [
        Image(.customerMinjiSmile),
        Image(.customerMinjiTalk)
    ]
    
    private var displayImage: Image {
        if currentStep > 0 && !isAnswerCorrect {
            return Image(.customerMinjiIrritating)
        } else if audioPlayer.isPlayingSound {
            return images[currentImageIndex]
        } else {
            return Image(.customerMinjiSmile)
        }
    }
    
    private var displayText: String {
        if shouldPlayCustomerAnswerSound, let correctText = correctAnswerText {
            return correctText
        } else {
            return text
        }
    }
    
    var body: some View {
        ZStack {
            displayImage
                .resizable()
                .scaledToFit()
                .frame(width: 288)
                .padding(.top, 85)
            
            BeyondTheLineSimulatorSpeechBubble(speechBubbleType: .black, text: displayText)
                .padding(.bottom, 400)
                .opacity(isShowBlackSpeechBubble || audioPlayer.isPlayingSound ? 1 : 0)
            
            if showWarningDialog {
                VStack {
                    Spacer()
                    BeyondTheLineSimulatorDialog(message: text, isWarning: true)
                        .padding(.bottom, 24)
                }
            }
        }
        .onChange(of: currentStep) { _, newStep in
            if newStep > 0 {
                if isWarning {
                    showWarningDialog = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        showWarningDialog = false
                        onAudioFinished()
                    }
                } else if let soundResource, !isWarning {
                    audioPlayer.imageSwitchHandler = { newIndex in
                        currentImageIndex = newIndex
                    }
                    audioPlayer.play(soundResource: soundResource) {
                        onAudioFinished()
                    }
                } else {
                    onAudioFinished()
                }
            }
        }
        .onChange(of: shouldPlayCustomerAnswerSound) { _, shouldPlay in
            guard shouldPlay, let correctText = correctAnswerText else { return }
            
            // 애니메이션 시작 + 음성 재생
            audioPlayer.imageSwitchHandler = { newIndex in
                currentImageIndex = newIndex
            }
            audioPlayer.play(soundResource: reactionResource[currectReactionIndex]) {
                DispatchQueue.main.async {
                    shouldPlayCustomerAnswerSound = false
                }
            }
        }
    }
}
