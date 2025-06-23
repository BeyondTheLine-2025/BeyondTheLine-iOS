//
//  SelectCustomerViewModel.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import CoreData
import Foundation

final class SelectCustomerViewModel: ObservableObject {
    @Published var situation: SituationModel?
    
    var situationID: UUID
    var selectedSituationModel: SituationModel? {
        situation
    }

    init(situationID: UUID) {
        self.situationID = situationID
    }
    
    func fetchSituations(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Situation> = Situation.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", situationID as CVarArg)
        request.fetchLimit = 1

        do {
            if let result = try context.fetch(request).first {
                self.situation = SituationModel(situation: result)
            } else {
                print("Situation not found : \(situationID)")
                self.situation = nil
            }
        } catch {
            print("CoreData fetch error: \(error.localizedDescription)")
            // TODO: - 에러 처리 방식 개선
        }
    }
    
    @MainActor
    func selectCustomer(_ customer: CustomerModel, coordinator: AppCoordinator) {
        coordinator.push(.simulator(customer.id))
    }
}
