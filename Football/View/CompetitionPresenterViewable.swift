//
//  CompetitionPresenterViewable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol CompetitionPresenterViewable {
    func showOnSuccess(with competitions: [Competition])
    func showOnFailure(with error: Error)
}
