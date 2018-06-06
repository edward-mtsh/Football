//
//  TeamPresenter.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class PlayerPresenter: PlayerPresentable {
    var view: PlayerPresenterViewable?
    var interactor: PlayerInteractable?
    var wireframe: WireframeDelegate?
    
    func fetchPlayers(with path: String) {
        self.interactor?.fetchPlayers(path: path)
    }
    
    func onFetchPlayersSuccess(with players: [Player]) {
        self.view?.showOnSuccess(with: players)
    }
    
    func onFetchPlayersFailure(with error: Error) {
        self.view?.showOnFailure(with: error)
    }
}
