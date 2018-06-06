//
//  Link.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class Link {
    var playerLink: PlayerLink?
    
    init(with dictionary: [String: AnyObject]?) {
        self.playerLink = PlayerLink(with: dictionary?["players"] as? [String:AnyObject])
    }
}
