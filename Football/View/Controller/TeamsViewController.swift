//
//  TeamsViewController.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var teams = [Team]()
    var competition: Competition?
    var presenter: CompetitionTeamPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.title = competition?.caption
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.registerCompetitionCell()
        self.fetchCompetitionTeams()
    }
    
    func fetchCompetitionTeams() {
        guard let id = competition?.id else {
            return
        }
        self.onMainThread {
            self.showBusyView()
            self.presenter?.fetchCompetitionTeams(with: id)
        }
    }
    
    func registerCompetitionCell() {
        let nib  = UINib(nibName: "TeamCollectionCellCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "TeamCollectionCellCollectionViewCell")
    }
    
    func onMainThread(block: @escaping ()-> Void) {
        DispatchQueue.main.async(execute: block)
    }
}

extension TeamsViewController: CompetitionTeamPresenterViewable {
    
    func showOnSuccess(with teams: [Team]) {
        self.onMainThread {
            self.hideBusyView()
            self.teams = teams
            self.collectionView.reloadData()
        }
    }
    
    func showOnFailure(with error: Error) {
        self.onMainThread {
            self.hideBusyView()
        }
    }
}

extension TeamsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section:Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionCellCollectionViewCell", for: indexPath) as! TeamCollectionCellCollectionViewCell
        cell.team = self.teams[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let team = self.teams[indexPath.row]
        self.presenter?.transitionToPlayersViewView(with: team)
    }
}
