//
//  CompetitionTablePresenter.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class CompetitionTablePresenter: CompetitionTablePresentable {
    var view: CompetitionTablePresenterViewable?
    var interactor: CompetitionInteractable?
    var wireframe: WireframeDelegate?
    
    func fetchCompetitionTable(with id:Int) {
        self.interactor?.fetchTableForCompetition(with: id)
    }
    
    func onFetchCompetitionTableSuccess(with table: [Table]) {
        self.view?.showOnSuccess(with: table)
    }
    
    func onFetchCompetitionTableFailure(with error: Error) {
        self.view?.showOnFailure(with: error)
    }
}
