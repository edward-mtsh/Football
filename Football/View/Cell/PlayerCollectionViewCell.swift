//
//  PlayerCollectionViewCell.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var jerseyNumberLabel: UILabel!
    @IBOutlet private weak var nationalityLabel: UILabel!
    
    var player:Player? {
        didSet {
            self.populateView()
        }
    }
    
    func populateView() {
        self.nameLabel.text = player?.name
        guard let number = player?.jerseyNumber, let position = player?.position, let nationality = player?.nationality  else {
            return
        }
        self.positionLabel.text = "Position: \(position)"
        self.jerseyNumberLabel.text = "Jersey Number: \(number)"
        self.nationalityLabel.text = "Natinality \(nationality)"
    }
}
