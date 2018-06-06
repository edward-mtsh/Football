//
//  TableViewController.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var standings = [Table]()
    var competition: Competition?
    var presenter: CompetitionTablePresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.title = competition?.caption
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.registerCompetitionCell()
        self.fetchCompetitionTable()
    }
    
    func fetchCompetitionTable() {
        guard let id = competition?.id else {
            return
        }
        self.onMainThread {
            self.presenter?.fetchCompetitionTable(with: id)
        }
    }
    
    func registerCompetitionCell() {
        let nib  = UINib(nibName: "CompetitionTableCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "CompetitionTableCollectionViewCell")
    }
    
    func onMainThread(block: @escaping ()-> Void) {
        DispatchQueue.main.async(execute: block)
    }
}

extension TableViewController: CompetitionTablePresenterViewable {
    
    func showOnSuccess(with table: [Table]) {
        self.onMainThread {
            self.hideBusyView()
            self.standings = table
            self.collectionView.reloadData()
        }        
    }
    
    func showOnFailure(with error: Error) {
        self.onMainThread {
            self.hideBusyView()
        }
    }
}

extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section:Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.standings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompetitionTableCollectionViewCell", for: indexPath) as! CompetitionTableCollectionViewCell
        cell.table = self.standings[indexPath.row]
        return cell
    }
}

