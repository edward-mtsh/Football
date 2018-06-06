//
//  Result.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class Result { 
    var goalsAwayTeam:Int?
    var goalsHomeTeam:Int?
    
    init(with dictionary: [String:AnyObject]?) {
        self.goalsAwayTeam = dictionary?["goalsAwayTeam"] as? Int
        self.goalsHomeTeam = dictionary?["goalsHomeTeam"] as? Int
    }
}
