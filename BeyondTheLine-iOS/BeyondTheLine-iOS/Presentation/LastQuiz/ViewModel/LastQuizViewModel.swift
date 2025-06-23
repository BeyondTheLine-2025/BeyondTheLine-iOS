//
//  LastQuizViewModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import CoreData
import Foundation
import SwiftUI

final class LastQuizViewModel: ObservableObject {
    private let customerID: UUID
    
    @Published var quizItems: [QuizItem] = []
    @Published var selectedAnswers: [UUID: Int] = [:]
    @Published var incorrectAnswers: [UUID: Set<Int>] = [:]
    @Published var currentSelectedIndex: Int?
    @Published var currentSheetType: BeyondTheLineBottomSheetType?
    
    init(customerID: UUID) {
        self.customerID = customerID
    }
    
    var progress: Double {
        guard !quizItems.isEmpty else { return 0.0 }

        let correctCount = selectedAnswers.filter { entry in
            let (id, index) = entry
            return quizItems.first(where: { $0.id == id })?.correctAnswerIndex == index
        }.count

        return Double(correctCount) / Double(quizItems.count)
    }
    
    func fetchCustomer(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Customer> = Customer.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", customerID as CVarArg)
        request.fetchLimit = 1
        
        do {
            if let customer = try context.fetch(request).first,
               let lastQuizs = customer.lastQuizs?.allObjects as? [Quiz] {
                self.quizItems = lastQuizs.compactMap { quiz in
                    guard let id = quiz.id,
                          let question = quiz.question,
                          let answers = quiz.answers as? [String] else { return nil }
                    return QuizItem(id: id, question: question, answers: answers, correctAnswerIndex: Int(quiz.answerIndex))
                }
            }
        } catch {
            print("ERROR: \(error)")
        }
    }
    
    func selectAnswer(for id: UUID, answerIndex: Int) -> Bool {
        guard let quiz = quizItems.first(where: { $0.id == id }) else { return false }
        
        selectedAnswers[id] = answerIndex
        
        if answerIndex == quiz.correctAnswerIndex {
            return true
        } else {
            incorrectAnswers[id, default: []].insert(answerIndex)
            return false
        }
    }
    
    func isAnswerDisabled(for id: UUID, index: Int) -> Bool {
        incorrectAnswers[id]?.contains(index) ?? false
    }
    
    func resetIncorrectSelection(for id: UUID) {
        if let selected = selectedAnswers[id] {
            incorrectAnswers[id, default: []].insert(selected)
        }
        selectedAnswers[id] = nil
    }
    
}
