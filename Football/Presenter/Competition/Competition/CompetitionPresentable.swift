//
//  CompetitionProtocol.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol CompetitionPresentable {
    var view: CompetitionPresenterViewable?{get set}
    func fetchCompetitions()
    func onFetchCompetitionSuccess(with competiotions: [Competition])
    func onFetchCompetitionFailure(with error: Error)
    func transitionToTeamsView(with competition: Competition)
}
