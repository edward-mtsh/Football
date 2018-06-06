//
//  CompetitionTablePresentable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol CompetitionTablePresentable {
    var view: CompetitionTablePresenterViewable?{get set}
    func fetchCompetitionTable(with id:Int)
    func onFetchCompetitionTableSuccess(with competiotions: [Table])
    func onFetchCompetitionTableFailure(with error: Error)
}
