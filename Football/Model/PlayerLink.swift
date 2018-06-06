//
//  PlayerLink.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class PlayerLink {
    var href:String?
    
    init(with dictionary: [String: AnyObject]?) {
        self.href = dictionary?["href"] as? String
    }
}
