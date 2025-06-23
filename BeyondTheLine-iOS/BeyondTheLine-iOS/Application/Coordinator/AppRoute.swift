//
//  AppRoute.swift
//  BeyondTheLine-iOS
//
//  Created by mini on 6/14/25.
//

import Foundation

enum AppRoute: Hashable {
    case selectBackground
    case selectCustomer(SituationModel.ID)
    case simulator
    case bridge
    case lastQuiz(CustomerModel.ID)
    case summary
}
