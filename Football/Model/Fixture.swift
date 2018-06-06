//
//  Fixture.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class Fixture {
    var id:Int?
    var competitionId:String?
    var date:String?
    var homeTeamName:String?
    var awayTeamName:String?
    var result:Result?
    
    init(with dictionary: [String: AnyObject]?) {
        self.date = dictionary?["date"] as? String
        self.homeTeamName = dictionary?["homeTeamName"] as? String
        self.awayTeamName = dictionary?["awayTeamName"] as? String
        self.result = Result(with: dictionary!["result"] as? [String:AnyObject])
    }
}
