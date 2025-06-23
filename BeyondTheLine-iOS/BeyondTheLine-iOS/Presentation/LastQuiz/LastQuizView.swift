//
//  LastQuizView.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import CoreData
import SwiftUI

struct LastQuizView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: LastQuizViewModel
    @State private var currentQuizIndex = 0
    
    var body: some View {
        LastQuizProgressView(viewModel: viewModel)
            .onAppear {
                viewModel.fetchCustomer(context: viewContext)
            }
        
        if currentQuizIndex < viewModel.quizItems.count {
            let quizItem = viewModel.quizItems[currentQuizIndex]
            
            VStack(alignment: .leading, spacing: 40) {
                LastQuizQuestionView(
                    quizItem: quizItem,
                    quizIndex: currentQuizIndex
                )
                
                LastQuizSelectionContainer(
                    quizItem: quizItem,
                    totalQuiz: viewModel.quizItems.count,
                    quizIndex: $currentQuizIndex,
                    viewModel: viewModel
                )
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct LastQuizView_Previews: PreviewProvider {
    static var previews: some View {
        let persistence = PersistenceController(inMemory: true)
        let context = persistence.container.viewContext
        
        let fetchRequest: NSFetchRequest<Customer> = Customer.fetchRequest()
        fetchRequest.fetchLimit = 1
        
        var customerID: UUID = UUID()
        
        if let customers = try? context.fetch(fetchRequest), let firstCustomer = customers.first {
            customerID = firstCustomer.id ?? UUID()
        }
        
        let coordinator = AppCoordinator()
        let viewModel = LastQuizViewModel(customerID: customerID)
        return NavigationStack {
            LastQuizView(viewModel: viewModel)
                .environment(\.managedObjectContext, context)
                .environmentObject(coordinator)
        }
    }
}
