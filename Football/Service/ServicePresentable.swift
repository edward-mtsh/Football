//
//  ServicePresentable.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

protocol ServicePresentable {
    func get(with path: Path, completion: @escaping (Any?, Error?) -> Void)
    func getById(with id: String, and path: Path, completion: @escaping (Any?, Error?) -> Void)
}
