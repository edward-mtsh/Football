//
//  CompetitionCollectionViewCell.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class CompetitionCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var leagueLabel: UILabel!
    @IBOutlet private weak var teamLabel: UILabel!
    
    var competition:Competition? {
        didSet {
            self.populateView()
        }
    }
    
    func populateView() {
        self.captionLabel.text = competition?.caption
        guard let league = competition?.league, let year = competition?.year else {
            return
        }
        self.leagueLabel.text = "\(league) - \(year)"
        guard let teams = competition?.numberOfTeams, let games = competition?.numberOfGames else {
            return
        }
        self.teamLabel.text = "Teams: \(teams) - Games: \(games)"
    }
}
