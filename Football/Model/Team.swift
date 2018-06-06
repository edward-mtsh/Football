//
//  Team.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class Team {
    var id:Int?
    var name:String?
    var shortName:String?
    var squadMarketValue:String?
    var crestUrl:String?
    var link:Link?
    
    init(with dictionary: [String: AnyObject]?) {
        self.name = dictionary?["name"] as? String
        self.shortName = dictionary?["shortName"] as? String
        self.crestUrl = dictionary?["crestUrl"] as? String
        self.link = Link(with: dictionary?["_links"] as? [String:AnyObject])
    }
}
