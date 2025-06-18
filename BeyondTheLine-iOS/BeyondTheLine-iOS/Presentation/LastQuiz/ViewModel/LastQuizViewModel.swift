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
    @Published var quizItems: [QuizItem] = []
    @Published var selectedAnswers: [UUID: Int] = [:]
    
    var progress: Double {
        guard !quizItems.isEmpty else { return 0.0 }
        return Double(selectedAnswers.count) / Double(quizItems.count)
    }
    
    func fetchCustomer(context: NSManagedObjectContext, name: String) {
        let request: NSFetchRequest<Customer> = Customer.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        request.fetchLimit = 1
        
        do {
            if let customer = try context.fetch(request).first,
               let lastQuizs = customer.lastQuizs?.allObjects as? [Quiz] {
                self.quizItems = lastQuizs.compactMap { quiz in
                    guard let id = quiz.id,
                          let question = quiz.question,
                          let answers = quiz.answers as? [String] else { return nil }
                    return QuizItem(id: id, question: question, answers: answers)
                }
            }
        } catch {
            print("ERROR: \(error)")
        }
    }
    
    func selectAnswer(for id: UUID, answerIndex: Int) {
        selectedAnswers[id] = answerIndex
        print("SELECTED ANSWER INDEX: \(answerIndex)")
    }
    
    func selectedAnswerIndex(for id: UUID) -> Int? {
        selectedAnswers[id]
    }
}
