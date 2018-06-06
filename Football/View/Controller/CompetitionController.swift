//
//  ViewController.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class CompetitionController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var competitions = [Competition]()
    var presenter: CompetitionPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.setupNavigationBar()
        self.injectDependencies()
        self.registerCompetitionCell()
        self.showBusyView()
        self.presenter?.fetchCompetitions()
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Competitions"        
    }
    
    func injectDependencies() {
        let dependancyContainer = DependencyContainer.container()
        self.presenter = dependancyContainer.resolve(CompetitionPresentable.self)
        self.presenter?.view = self
    }
    
    func registerCompetitionCell() {
        let nib  = UINib(nibName: "CompetitionCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "CompetitionCollectionViewCell")
    }

    func onMainThread(block: @escaping ()-> Void) {
        DispatchQueue.main.async(execute: block)
    }
}

extension CompetitionController: CompetitionPresenterViewable {
    
    func showOnSuccess(with competitions: [Competition]) {
        self.onMainThread {
            self.hideBusyView()
            self.competitions = competitions
            self.collectionView.reloadData()
        }        
    }
    
    func showOnFailure(with error: Error) {
        self.onMainThread {
            self.hideBusyView()
        }
    }
}

extension CompetitionController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section:Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.competitions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompetitionCollectionViewCell", for: indexPath) as! CompetitionCollectionViewCell
        cell.competition = self.competitions[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let competition = self.competitions[indexPath.row]
        self.presenter?.transitionToTeamsView(with: competition)
    }
}
