//
//  Player.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class Player {
    var id:Int?
    var name:String?
    var position:String?
    var jerseyNumber:Int?
    var nationality:String?
    var dateOfBirth:String?
    
    init(with dictionary: [String: AnyObject]?) {
        self.name = dictionary?["name"] as? String
        self.position = dictionary?["position"] as? String
        self.jerseyNumber = dictionary?["jerseyNumber"] as? Int
        self.nationality = dictionary?["nationality"] as? String
        self.dateOfBirth = dictionary?["dateOfBirth"] as? String
    }
}
