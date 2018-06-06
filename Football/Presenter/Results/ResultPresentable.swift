//
//  ResultPresentable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation
protocol ResultPresentable {
    var view: ResultPresenterViewable?{get set}
    func fetchResults(with id:Int)
    func onFetchResultsSuccess(with results: [Fixture])
    func onFetchResultsFailure(with error: Error)
}

