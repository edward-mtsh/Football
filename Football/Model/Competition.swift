//
//  Competition.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class Competition {
    var id:Int?
    var caption:String?
    var league:String?
    var year: String?
    var numberOfTeams:Int?
    var numberOfGames:Int?
    var lastUpdated: String?
    
    init(with dictionary: [String: AnyObject]?) {
        self.id = dictionary?["id"] as? Int
        self.caption = dictionary?["caption"] as? String
        self.league = dictionary?["league"] as? String
        self.year = dictionary?["year"] as? String
        self.numberOfTeams = dictionary?["numberOfTeams"] as? Int
        self.numberOfGames = dictionary?["numberOfGames"] as? Int
        self.lastUpdated = dictionary?["lastUpdated"] as? String
    }
}
