//
//  ResultPresenter.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class ResultPresenter: ResultPresentable {
    var view: ResultPresenterViewable?
    var interactor: ResultInteractable?
    
    func fetchResults(with id: Int) {
        self.interactor?.fetchResults(id: id)
    }
    
    func onFetchResultsSuccess(with results: [Fixture]) {
        self.view?.showOnSuccess(with: results)
    }
    
    func onFetchResultsFailure(with error: Error) {
        self.view?.showOnFailure(with: error)
    }
}
