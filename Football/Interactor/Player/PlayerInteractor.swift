//
//  PlayerInteractor.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class PlayerInteractor: PlayerInteractable {
    var servicePresentable: ServicePresentable?
    var playerPresentable: PlayerPresentable?
    
    func fetchPlayers(path: String) {
        var players = [Player]()
        self.servicePresentable?.getById(with: path, and: .none, completion: { (result, error) in
            if let failure = error {
                self.playerPresentable?.onFetchPlayersFailure(with: failure)
            } else {
                let value = result as? [String: Any]
                let list = value!["players"] as? [[String:AnyObject]]
                list?.forEach({ player in
                    players.append(Player(with: player))
                })
                self.playerPresentable?.onFetchPlayersSuccess(with: players)
            }
        })
    }
}
