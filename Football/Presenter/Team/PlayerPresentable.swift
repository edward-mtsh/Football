//
//  PlayersPresentable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol PlayerPresentable {
    var view: PlayerPresenterViewable?{get set}
    func fetchPlayers(with path:String)
    func onFetchPlayersSuccess(with players: [Player])
    func onFetchPlayersFailure(with error: Error)
}

