//
//  PlayerPresenterViewable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol PlayerPresenterViewable {
    func showOnSuccess(with players: [Player])
    func showOnFailure(with error: Error)
}
