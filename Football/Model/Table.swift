//
//  Table.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class Table {
    var position:Int?
    var team:String?
    var teamId:Int?
    var playedGames:Int?
    var crestURI: String?
    var points:Int?
    var goals:Int?
    var goalsAgainst:Int?
    var goalDifference:Int?
    var losses:Int?
    var wins:Int?
    
    init(with dictionary: [String: AnyObject]?) {
        self.position = dictionary?["position"] as? Int
        self.team = dictionary?["teamName"] as? String
        self.playedGames = dictionary?["playedGames"] as? Int
        self.crestURI = dictionary?["crestURI"] as? String
        self.points = dictionary?["points"] as? Int
        self.goals = dictionary?["goals"] as? Int
        self.goalsAgainst = dictionary?["goalsAgainst"] as? Int
        self.goalDifference = dictionary?["goalDifference"] as? Int
        self.losses = dictionary?["losses"] as? Int
        self.wins = dictionary?["wins"] as? Int
    }
}
