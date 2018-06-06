//
//  Service.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireSwiftyJSON

class DataService: ServicePresentable {

    let Headers = ["X-Auth-Token": "ccb807fcdc7446cf888044463b5c66f5"]
    let baseUrl = "http://api.football-data.org/"
    var url = ""
    
    func get(with path: Path, completion: @escaping (Any?, Error?) -> Void) {
        let url = "\(baseUrl)\(path.rawValue)"
        Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Headers).responseSwiftyJSON { response in
            if response.result.isSuccess {
                let result = response.result.value?.arrayObject
                completion(result, nil)
            } else {
                completion(nil, response.error)
            }
        }
    }
    
    func getById(with id: String, and path: Path, completion: @escaping (Any?, Error?) -> Void) {
        if path != .none {
            url = "\(baseUrl)\(path.rawValue)\(id)"
        } else {
            url = id
        }        
        Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Headers).responseSwiftyJSON { response in
            if response.result.isSuccess {
                let result = response.result.value?.dictionaryObject
                completion(result, nil)
            } else {
                completion(nil, response.error)
            }
        }
    }
}
