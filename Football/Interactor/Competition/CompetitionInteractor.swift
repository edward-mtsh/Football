//
//  CompetitionInteractor.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation

class CompetitionInteractor: CompetitionInteractable {
    var servicePresentable: ServicePresentable?
    var competitionPresentable: CompetitionPresentable?
    var competitionTeamPresentable: CompetitionTeamPresentable?
    var competitionTablePresentable: CompetitionTablePresentable?
    
    func fetchCompetitions() {
        var competitions = [Competition]()
        self.servicePresentable?.get(with: .competitions, completion: { (result, error) in
            if let failure = error {
                self.competitionPresentable?.onFetchCompetitionFailure(with: failure)
            } else {
                let value = result as? [[String:AnyObject]]
                value?.forEach({ competition in
                    competitions.append(Competition(with: competition))
                })
                self.competitionPresentable?.onFetchCompetitionSuccess(with: competitions)
            }
        })
    }
    
    func fetchTeamsForCompetition(with id:Int) {
        var teams = [Team]()
        let id = "\(id)/teams"
        self.servicePresentable?.getById(with: id, and: .competitions, completion: { (result, error) in
            if let failure = error {
                self.competitionTeamPresentable?.onFetchCompetitionTeamsFailure(with: failure)
            } else {
                let value = result as? [String: Any]
                let list = value!["teams"] as? [[String:AnyObject]]                
                list?.forEach({ team in
                    teams.append(Team(with: team))
                })
                self.competitionTeamPresentable?.onFetchCompetitionTeamsSuccess(with: teams)
            }
        })
    }
    
    func fetchTableForCompetition(with id:Int) {
        var standings = [Table]()
        let id = "\(id)/leagueTable"
        self.servicePresentable?.getById(with: id, and: .competitions, completion: { (result, error) in
            if let failure = error {
                self.competitionTablePresentable?.onFetchCompetitionTableFailure(with: failure)
            } else {
                let value = result as? [String: Any]
                let list = value!["standing"] as? [[String:AnyObject]]
                list?.forEach({ table in
                    standings.append(Table(with: table))
                })
                self.competitionTablePresentable?.onFetchCompetitionTableSuccess(with: standings)
            }
        })
    }
}
