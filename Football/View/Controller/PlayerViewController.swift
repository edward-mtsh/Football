//
//  PlayerViewController.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var players = [Player]()
    var team:Team?
    var presenter: PlayerPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = team?.name
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.registerCell()
        self.injectDependancies()
        self.fetchPlayers()
    }
    
    func injectDependancies() {
        let dependencyContainer = DependencyContainer.container()
        self.presenter = dependencyContainer.resolve(PlayerPresentable.self)
        self.presenter?.view = self
    }
    
    func fetchPlayers() {
        guard let href = team?.link?.playerLink?.href else {
            return
        }
        self.onMainThread {
            self.showBusyView()
            self.presenter?.fetchPlayers(with: href)
        }
    }

    func registerCell() {
        let nib  = UINib(nibName: "PlayerCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "PlayerCollectionViewCell")
    }
    
    func onMainThread(block: @escaping ()-> Void) {
        DispatchQueue.main.async(execute: block)
    }
}

extension PlayerViewController: PlayerPresenterViewable {
    
    func showOnSuccess(with players: [Player]) {
        self.onMainThread {
            self.hideBusyView()
            self.players = players
            self.collectionView.reloadData()
        }        
    }
    
    func showOnFailure(with error: Error) {
        self.onMainThread {
            self.hideBusyView()
        }
    }
}

extension PlayerViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section:Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionViewCell", for: indexPath) as! PlayerCollectionViewCell
        cell.player = self.players[indexPath.row]
        return cell
    }
}

