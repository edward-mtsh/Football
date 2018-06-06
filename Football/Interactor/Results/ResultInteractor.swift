//
//  ResultInteractor.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class ResultInteractor: ResultInteractable {
    var servicePresentable: ServicePresentable?
    var resultPresentable:  ResultPresentable?
    
    func fetchResults(id: Int) {
        var results = [Fixture]()
        let id = "\(id)/fixtures"
        self.servicePresentable?.getById(with: id, and: .competitions, completion: { (result, error) in
            if let failure = error {
                self.resultPresentable?.onFetchResultsFailure(with: failure)
            } else {
                let value = result as? [String: Any]
                let list = value!["fixtures"] as? [[String:AnyObject]]
                list?.forEach({ fixture in
                    results.append(Fixture(with: fixture))
                })
                self.resultPresentable?.onFetchResultsSuccess(with: results)
            }
        })
    }
}
