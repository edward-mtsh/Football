//
//  CompetitionPresenter.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class CompetitionPresenter: CompetitionPresentable {
    var view: CompetitionPresenterViewable?
    var interactor: CompetitionInteractable?
    var wireframe: WireframeDelegate?
    
    func fetchCompetitions() {
        self.interactor?.fetchCompetitions()
    }
    
    func onFetchCompetitionSuccess(with competiotions: [Competition]) {
        self.view?.showOnSuccess(with: competiotions)
    }
    
    func onFetchCompetitionFailure(with error: Error) {
        self.view?.showOnFailure(with: error)
    }
    
    func transitionToTeamsView(with competition: Competition) {
        self.wireframe?.transitionToTeamsView(view as! CompetitionController, with: competition)
    }
}
