//
//  CompetitionTeamPresentable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol CompetitionTeamPresentable {
    var view: CompetitionTeamPresenterViewable?{get set}
    func fetchCompetitionTeams(with id:Int)
    func onFetchCompetitionTeamsSuccess(with competiotions: [Team])
    func onFetchCompetitionTeamsFailure(with error: Error)
    func transitionToPlayersViewView(with player: Team)
}

