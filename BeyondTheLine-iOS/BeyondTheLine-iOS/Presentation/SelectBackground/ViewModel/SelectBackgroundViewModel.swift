//
//  SelectBackgroundViewModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import CoreData
import Foundation

final class SelectBackgroundViewModel: ObservableObject {
    @Published var backgrounds: [BackgroundModel] = []

    func fetchSituations(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Background> = Background.fetchRequest()
        request.sortDescriptors = []
        
        do {
            let result = try context.fetch(request)
            self.backgrounds = result.map { BackgroundModel(background: $0) }
        } catch {
            print("CoreData fetch error: \(error.localizedDescription)")
            // TODO: - 에러 처리 방식 개선
        }
    }
    
    @MainActor
    func selectBackground(_ situation: SituationModel, coordinator: AppCoordinator) {
        coordinator.push(.selectCustomer(situation.id))
    }
}
