//
//  ResultsViewController.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/06.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var results = [Fixture]()
    var competition: Competition?
    var presenter: ResultPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.title = competition?.caption
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.registerCompetitionCell()
        self.fetchResults()
    }
    
    func fetchResults() {
        guard let id = competition?.id else {
            return
        }
        self.onMainThread {
            self.showBusyView()
            self.presenter?.fetchResults(with: id)
        }
    }
    
    func registerCompetitionCell() {
        let nib  = UINib(nibName: "ResultsCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "ResultsCollectionViewCell")
    }
    
    func onMainThread(block: @escaping ()-> Void) {
        DispatchQueue.main.async(execute: block)
    }
}

extension ResultsViewController: ResultPresenterViewable {
    
    func showOnSuccess(with results: [Fixture]) {
        self.onMainThread {
            self.hideBusyView()
            self.results = results
            self.collectionView.reloadData()
        }        
    }
    
    func showOnFailure(with error: Error) {
        self.onMainThread {
            self.hideBusyView()
        }
    }
}

extension ResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section:Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultsCollectionViewCell", for: indexPath) as! ResultsCollectionViewCell
        cell.fixture = self.results[indexPath.row]
        return cell
    }
}

