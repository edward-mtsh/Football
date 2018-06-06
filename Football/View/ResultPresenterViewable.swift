//
//  ResultPresenterViewable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol ResultPresenterViewable {
    func showOnSuccess(with results: [Fixture])
    func showOnFailure(with error: Error)
}
