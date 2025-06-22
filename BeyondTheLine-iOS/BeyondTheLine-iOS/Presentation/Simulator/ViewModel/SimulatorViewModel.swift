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
    
    @Published private(set) var simulatorItem: SimulatorModel = SimulatorModel(
        introMessage: "", quizs: [])
    
    @Published var selectedQuiz: SimulatorQuizItem?
    @Published var selectedAnswerIndex: Int?
    @Published var isAnswerCorrect: Bool = false
    
    init(customerID: UUID) {
        self.customerID = customerID
    }
    
    func evaluateAnswer(for index: Int, in quiz: SimulatorQuizItem) {
        selectedQuiz = quiz
        selectedAnswerIndex = index
        isAnswerCorrect = (index == quiz.correctAnswerIndex)
    }
    
    func fetchCustomer(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Customer> = Customer.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", customerID as CVarArg)
        request.fetchLimit = 1

        do {
            if let result = try context.fetch(request).first,
               //let simQuizs = result.simulatorQuizs?.allObjects as? [Quiz],
               let introMessage = result.introMessage {
                let simQuizs = result.simulatorQuizs?.allObjects.compactMap { $0 as? Quiz }
                
                let quizItems = simQuizs?.reduce(into: [SimulatorQuizItem]()) { result, quiz in
                    if let id = quiz.id,
                       let question = quiz.question,
                       let answers = quiz.answers as? [String],
                       let feedbacks = quiz.feedbacks as? [String] {
                        result.append(
                            SimulatorQuizItem(
                                id: id,
                                question: question,
                                answers: answers,
                                correctAnswerIndex: Int(quiz.answerIndex),
                                feedbacks: feedbacks
                            )
                        )
                    }
                }

                self.simulatorItem = SimulatorModel(
                    introMessage: introMessage,
                    quizs: quizItems ?? []
                )
            } else {
                print("Customer not found")
            }
        } catch {
            print("\(error)")
        }
    }
}
