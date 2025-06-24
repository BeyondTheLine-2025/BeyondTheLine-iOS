//
//  SimulatorView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import SwiftUI

struct SimulatorView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: SimulatorViewModel
    
    @StateObject private var audioPlayer = BeyondTheLineAudioPlayer()
    
    @State private var currentStep: Int = 0
    @State private var isShowBlackSpeechBubble: Bool = false
    @State private var isShowBlueSpeechBubble: Bool = false
    @State private var isShowQuizAlert: Bool = false
    @State private var isShowBottomSheet: Bool = false
    @State private var disabledAnswerIndices: [Int] = []
    @State private var selectedAnswerText: String?
    @State private var shouldPlayCustomerAnswerSound: Bool = false
    @State private var correctAnswerText: String?
    @State private var currentReactionIndex: Int = 0
    
    @State private var shouldPlayAudio: Bool = false
    
    private var currentSimQuiz: SimulatorQuizModel? {
        guard currentStep > 0, currentStep <= viewModel.simulatorItem.simQuizs.count else { return nil }
        return viewModel.simulatorItem.simQuizs[currentStep - 1]
    }
    
    var body: some View {
        ZStack {
            SimualtorBackground()
            
            SimulationActionCustomer(
                currentStep: $currentStep,
                isAnswerCorrect: $viewModel.isAnswerCorrect,
                isShowBlackSpeechBubble: $isShowBlackSpeechBubble,
                
                shouldPlayCustomerAnswerSound: $shouldPlayCustomerAnswerSound,
                correctAnswerText: $correctAnswerText,
                currectReactionIndex: $currentReactionIndex,
                text: (isShowBlackSpeechBubble ? currentSimQuiz?.wrongAnswer : currentSimQuiz?.preText ?? "") ?? "",
                soundResource: (currentSimQuiz?.preText?.isEmpty != false) ? nil : SoundLiterals.customer1Take1,
                isWarning: currentSimQuiz?.isWarning ?? false,
                onAudioFinished: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if currentStep <= viewModel.simulatorItem.simQuizs.count {
                            isShowQuizAlert = true
                        }
                    }
                }
            )
            
            VStack {
                BeyondTheLineNavigationBar(
                    leadingType: .close(action: { coordinator.pop() }),
                    centerType: .progress(
                        Binding(
                            get: { CGFloat(currentStep) / CGFloat(max(viewModel.simulatorItem.simQuizs.count, 1)) },
                            set: { _ in }
                        )
                    )
                )
                .padding(.top, 59)
                .frame(height: 110)
                
                Spacer()
                
                if currentStep == 0 {
                    BeyondTheLineSimulatorDialog(message: viewModel.simulatorItem.introMessage)
                        .padding(.bottom, 32)
                } else if currentStep > viewModel.simulatorItem.simQuizs.count {
                    BeyondTheLineButton(
                        title: "완료",
                        buttonState: .abled,
                        action: { viewModel.pushToBridgeView(coordinator: coordinator) }
                    )
                    .padding(.bottom, 34)
                } else {
                    BeyondTheLineSimulatorSpeechBubble(
                        speechBubbleType: .blue,
                        text: selectedAnswerText ?? ""
                    )
                    .padding(.bottom, 32)
                    .opacity(isShowBlueSpeechBubble ? 1 : 0)
                }
            }
        }
        .onAppear {
            viewModel.fetchCustomer(context: viewContext)
        }
        .onTapGesture {
            if !audioPlayer.isPlayingSound {
                currentStep += 1
            }
        }
        .onChange(of: currentStep) {
            disabledAnswerIndices.removeAll()
        }
        .beyondTheLineQuizAlert(
            isPresented: $isShowQuizAlert,
            disabledIndices: $disabledAnswerIndices,
            question: currentSimQuiz?.quiz.question ?? "",
            options: currentSimQuiz?.quiz.answers ?? [],
            onSelect: { selectedIndex in
                if let quiz = currentSimQuiz?.quiz {
                    viewModel.evaluateAnswer(for: selectedIndex, in: quiz)
                    selectedAnswerText = quiz.answers[selectedIndex]
                    isShowQuizAlert = false
                    isShowBlueSpeechBubble = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isShowBlueSpeechBubble = false
                        isShowBottomSheet = true
                        
                        audioPlayer.play(
                            soundResource: viewModel.isAnswerCorrect ? SoundLiterals.correct : SoundLiterals.wrong,
                            completion: {}
                        )
                        
                        if !viewModel.isAnswerCorrect {
                            isShowBlackSpeechBubble = true
                            disabledAnswerIndices.insert(selectedIndex, at: 0)
                        }
                    }
                }
            }
        )
        .beyondTheLineBottomSheet(
            isPresented: $isShowBottomSheet,
            sheetType: viewModel.isAnswerCorrect ? .correct : .incorrect,
            description: {
                if let quiz = currentSimQuiz?.quiz {
                    let index = viewModel.isAnswerCorrect ? 0 : (viewModel.selectedAnswerIndex ?? 0)
                    return quiz.feedbacks[index]
                }
                return ""
            }(),
            buttonTitle: viewModel.isAnswerCorrect ? "확인" : "다시 답하기",
            onTapButton: {
                withAnimation {
                    isShowBottomSheet = false
                }
                if viewModel.isAnswerCorrect {
                    correctAnswerText = currentSimQuiz?.correctAnswer
                    shouldPlayCustomerAnswerSound = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        currentStep += 1
                        currentReactionIndex += 1
                        isShowBlueSpeechBubble = false
                        selectedAnswerText = nil
                        correctAnswerText = nil
                    }
                } else {
                    isShowBlackSpeechBubble = false
                    isShowQuizAlert = true
                }
            }
        )
        .padding(.bottom, 32)
        .transition(.move(edge: .bottom))
        .animation(.easeInOut, value: isShowBottomSheet)
        .toolbar(.hidden, for: .navigationBar)
    }
}
