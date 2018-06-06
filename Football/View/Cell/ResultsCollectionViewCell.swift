//
//  ResultsCollectionViewCell.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class ResultsCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var homeTeamLabel: UILabel!
    @IBOutlet private weak var awayTeamLabel: UILabel!
    @IBOutlet private weak var homeTeamGoalsLabel: UILabel!
    @IBOutlet private weak var awayTeamGoalsLabel: UILabel!    
    @IBOutlet private weak var matchDayLabel: UILabel!
    
    var fixture: Fixture? {
        didSet {
            self.populateView()
        }
    }
    
    func populateView() {
        
        self.homeTeamLabel.text = fixture?.homeTeamName
        self.awayTeamLabel.text = fixture?.awayTeamName
        guard let homeGoals = fixture?.result?.goalsHomeTeam, let awayGoals = fixture?.result?.goalsAwayTeam, let date = fixture?.date else {
            return
        }
        self.matchDayLabel.text = "Match Date: \(date)"
        self.homeTeamGoalsLabel.text = "\(homeGoals)"
        self.awayTeamGoalsLabel.text = "\(awayGoals)"
    }
}
