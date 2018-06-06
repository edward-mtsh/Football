//
//  TabBarViewController.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/05.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    let dependancyContainer = DependencyContainer.container()
    var competition:Competition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBarColorPallete()
        self.injectDependencies()
    }
    
    func setupNavigationBarColorPallete() {
         UINavigationBar.appearance().tintColor = .red
         UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.red]
    }
    
    func injectDependencies() {
        let teamViewController = self.viewControllers?.first as! TeamsViewController
        teamViewController.presenter = dependancyContainer.resolve(CompetitionTeamPresentable.self)
        teamViewController.presenter?.view = teamViewController
        teamViewController.competition = competition
        
        let tableViewController = self.viewControllers?[1] as! TableViewController
        tableViewController.presenter = dependancyContainer.resolve(CompetitionTablePresentable.self)
        tableViewController.presenter?.view = tableViewController
        tableViewController.competition = competition
        
        let resultsViewController = self.viewControllers?.last as! ResultsViewController
        resultsViewController.presenter = dependancyContainer.resolve(ResultPresentable.self)
        resultsViewController.presenter?.view = resultsViewController
        resultsViewController.competition = competition
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
