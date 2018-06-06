//
//  CompetitionTeamPresenter.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class CompetitionTeamPresenter: CompetitionTeamPresentable {
    var view: CompetitionTeamPresenterViewable?
    var interactor: CompetitionInteractable?
    var wireframe: WireframeDelegate?
    
    func fetchCompetitionTeams(with id:Int) {
        self.interactor?.fetchTeamsForCompetition(with: id)
    }
    
    func onFetchCompetitionTeamsSuccess(with teams: [Team]) {
        self.view?.showOnSuccess(with: teams)
    }
    
    func onFetchCompetitionTeamsFailure(with error: Error) {
        self.view?.showOnFailure(with: error)
    }
    
    func transitionToPlayersViewView(with team: Team) {
        self.wireframe?.transitionToPlayersView(view as! TeamsViewController, with: team)
    }
}

