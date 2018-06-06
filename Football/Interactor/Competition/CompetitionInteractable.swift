//
//  CompetitionInteractable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol CompetitionInteractable {
    func fetchCompetitions()
    func fetchTeamsForCompetition(with id:Int)
    func fetchTableForCompetition(with id:Int)
}
