//
//  WireframeDelegate.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol WireframeDelegate {
    func onMainThread(block: @escaping ()-> Void)
    func transitionToTeamsView(_ controller:CompetitionController, with competition: Competition)
    func transitionToPlayersView(_ controller:TeamsViewController, with player: Team)
}
