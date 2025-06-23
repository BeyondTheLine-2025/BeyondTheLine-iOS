//
//  SummaryScriptViewModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import CoreData
import Foundation

final class SummaryScriptViewModel: ObservableObject {
    @Published var customerIntro: String = ""
    @Published var quizzes: [SummaryScriptModel] = []
    @Published var feedbacks: [String] = []

    // TODO: - 손님 상항 전달받아 사용하도록 수정
    private var customer: Customer?

    func fetchSimulationData(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Customer> = Customer.fetchRequest()
        request.fetchLimit = 1
        
        do {
            if let customer = try context.fetch(request).first {
                self.customer = customer
                customerIntro = customer.introMessage ?? ""
                feedbacks = (customer.summaryFeedbacks as? [String]) ?? []
                
                let simQuizzes = (customer.simulatorQuizs?.sortedArray(
                    using: [NSSortDescriptor(
                        key: #keyPath(SimulatorQuiz.order),
                        ascending: true)
                    ]) as? [SimulatorQuiz]) ?? []
                quizzes = simQuizzes.enumerated().compactMap { idx, quiz in
                    guard let pre = quiz.preText,
                          let quizSet = quiz.quiz as? Set<Quiz>,
                          let quizEntity = quizSet.first,
                          let answers = quizEntity.answers as? [String],
                          let feedbacks = quizEntity.feedbacks as? [String]
                    else { return nil }
                    
                    let quizWarning = quiz.isWarning
                    let quizAnswer = quiz.correctAnswer
                    let correctIdx = Int(quizEntity.answerIndex)
                    
                    return SummaryScriptModel(
                        id: idx,
                        order: Int(quiz.order),
                        customerText: pre,
                        isWarning: quizWarning,
                        answerText: answers[safe: correctIdx] ?? "",
                        correctAnswerText: quizAnswer ?? "",
                        feedbackText: feedbacks[safe: correctIdx] ?? ""
                    )
                }
            }
        } catch {
            print("CoreData fetch error: \(error.localizedDescription)")
            // TODO: - 에러 처리 방식 개선
        }
    }
    
    func toggleFeedback(for quiz: SummaryScriptModel) {
        guard let index = quizzes.firstIndex(where: { $0.id == quiz.id }) else { return }
        quizzes[index].isFeedbackVisible.toggle()
    }
    
    @MainActor
    func selectFinish(coordinator: AppCoordinator, context: NSManagedObjectContext) {
        if let customer = customer {
            customer.learningCount += 1
            do {
                try context.save()
                print("Success learningCount Add: \(customer.learningCount)")
            } catch {
                print("Fail learningCount Add: \(error)")
            }
        }
        coordinator.popToRoot()
    }
}
