//
//  CompetitionTableCollectionViewCell.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit
import Kingfisher

class CompetitionTableCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var lostLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var playedLabel: UILabel!
    
    var table: Table? {
        didSet {
            self.populateView()
        }
    }
    
    func populateView() {
        guard let team = table?.team, let position = table?.position, let points = table?.points, let played = table?.playedGames, let goals = table?.goals, let wins = table?.wins, let losses = table?.losses else {
            return
        }
        self.teamLabel.text = "Team: \(team)"
        self.positionLabel.text = "Position: \(position)"
        self.pointsLabel.text = "Points: \(points)"
        self.playedLabel.text = "Played: \(played) games"
        self.goalsLabel.text = "Scored: \(goals) goals"
        self.winLabel.text = "Won: \(wins) games"
        self.lostLabel.text = "Lost: \(losses) games"
        self.loadTeamImage()
    }
    
    func loadTeamImage() {
        guard let url = table?.crestURI else {
            return
        }
        guard let imageUrl = URL(string: url) else {
            return
        }
        let placeholder = UIImage( named: "placeholder")
        let resource = ImageResource(downloadURL: imageUrl, cacheKey: imageUrl.absoluteString)
        self.imageView.kf.setImage(with: resource, placeholder: placeholder, options: nil, progressBlock: nil, completionHandler: nil)
    }
}
