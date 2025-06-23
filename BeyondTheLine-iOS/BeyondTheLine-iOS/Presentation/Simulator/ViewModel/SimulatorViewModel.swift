//
//  SimulatorViewModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import CoreData
import Foundation
import SwiftUI

final class SimulatorViewModel: ObservableObject {
    var customerID: UUID

    @Published private(set) var simulatorItem: SimulatorModel = SimulatorModel(introMessage: "", simQuizs: [])
    @Published var selectedAnswerIndex: Int?
    @Published var isAnswerCorrect: Bool = true

    init(customerID: UUID) {
        self.customerID = customerID
    }

    func evaluateAnswer(for index: Int, in quiz: QuizModel) {
        selectedAnswerIndex = index
        isAnswerCorrect = (index == quiz.correctAnswerIndex)
    }

    func fetchCustomer(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Customer> = Customer.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", customerID as CVarArg)
        request.fetchLimit = 1

        do {
            if let customer = try context.fetch(request).first,
               let introMessage = customer.introMessage,
               let simulatorQuizsOrderedSet = customer.simulatorQuizs,
               let simulatorQuizs = simulatorQuizsOrderedSet.array as? [SimulatorQuiz] {

                let sortedSimulatorQuizs = simulatorQuizs.sorted { $0.order < $1.order }

                let simQuizModels: [SimulatorQuizModel] = sortedSimulatorQuizs.compactMap { simQuiz in
                    guard let quiz = simQuiz.quiz,
                          let question = quiz.question,
                          let answers = quiz.answers as? [String],
                          let feedbacks = quiz.feedbacks as? [String],
                          let correctAnswer = simQuiz.correctAnswer,
                          let wrongAnswer = simQuiz.wrongAnswer
                    else {
                        return nil
                    }

                    let quizModel = QuizModel(
                        question: question,
                        answers: answers,
                        correctAnswerIndex: Int(quiz.answerIndex),
                        feedbacks: feedbacks
                    )

                    return SimulatorQuizModel(
                        preText: simQuiz.preText,
                        quiz: quizModel,
                        wrongAnswer: wrongAnswer,
                        correctAnswer: correctAnswer,
                        isWarning: simQuiz.isWarning
                    )
                }

                self.simulatorItem = SimulatorModel(
                    introMessage: introMessage,
                    simQuizs: simQuizModels
                )
            } else {
                print("Customer fetch 실패")
            }
        } catch {
            print("❌ Fetch error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func pushToBridgeView(coordinator: AppCoordinator) {
        coordinator.push(.bridge(customerID, step: .finishSimulator))
    }
}
