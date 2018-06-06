//
//  Wireframe.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit
import Foundation

class Wireframe: WireframeDelegate {
    
    func onMainThread(block: @escaping ()-> Void) {
        DispatchQueue.main.async(execute: block)
    }
    
    func transitionToTeamsView(_ controller:CompetitionController, with competition: Competition) {
        self.onMainThread {
            let navigationController = controller.navigationController
            guard let newController = controller.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else {
                return
            }
            newController.competition = competition
            navigationController?.pushViewController(newController, animated: true)
        }
    }
    
    func transitionToPlayersView(_ controller: TeamsViewController, with team: Team) {
        self.onMainThread {
            let navigationController = controller.navigationController
            guard let newController = controller.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController else {
                return
            }
            newController.team = team
            navigationController?.pushViewController(newController, animated: true)
        }
    }
}
