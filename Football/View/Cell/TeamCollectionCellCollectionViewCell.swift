//
//  TeamCollectionCellCollectionViewCell.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit
import Kingfisher

class TeamCollectionCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var shortNameLabel: UILabel!
    
    var team: Team? {
        didSet {
            self.populateView()            
        }
    }
    
    func populateView() {
        self.nameLabel.text = team?.name
        self.shortNameLabel.text = team?.shortName
        self.loadTeamImage()
    }
    
    func loadTeamImage() {
        guard let url = team?.crestUrl else {
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
