//
//  CompetitionTablePresenterViewable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol CompetitionTablePresenterViewable {
    func showOnSuccess(with standings: [Table])
    func showOnFailure(with error: Error)
}
