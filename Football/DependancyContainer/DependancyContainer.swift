//
//  DependancyContainer.swift
//  Football
//
//  Created by Edward Mtshweni on 2018/06/04.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import Foundation
import Swinject

struct DependencyContainer {
    
    static func container() -> Container {
        let container = Container()
        
        container.register(CompetitionPresentable.self) { r in
            let competitionPresenter = CompetitionPresenter()
            let competitionInteractor = CompetitionInteractor()
            competitionInteractor.competitionPresentable = competitionPresenter
            competitionInteractor.servicePresentable = r.resolve(ServicePresentable.self)
            competitionPresenter.interactor = competitionInteractor
            competitionPresenter.wireframe = r.resolve(WireframeDelegate.self)
            return competitionPresenter
        }
        
        container.register(CompetitionTeamPresentable.self) { r in
            let teamPresenter = CompetitionTeamPresenter()
            let competitionInteractor = CompetitionInteractor()
            competitionInteractor.competitionTeamPresentable = teamPresenter
            competitionInteractor.servicePresentable = r.resolve(ServicePresentable.self)
            teamPresenter.interactor = competitionInteractor
            teamPresenter.wireframe = r.resolve(WireframeDelegate.self)
            return teamPresenter
        }
        
        container.register(CompetitionTablePresentable.self) { r in
            let tablePresenter = CompetitionTablePresenter()
            let competitionInteractor = CompetitionInteractor()
            competitionInteractor.competitionTablePresentable = tablePresenter
            competitionInteractor.servicePresentable = r.resolve(ServicePresentable.self)
            tablePresenter.interactor = competitionInteractor
            tablePresenter.wireframe = r.resolve(WireframeDelegate.self)
            return tablePresenter
        }
        
        container.register(PlayerPresentable.self) { r in
            let playerPresenter = PlayerPresenter()
            let playerInteractor = PlayerInteractor()
            playerInteractor.playerPresentable = playerPresenter
            playerInteractor.servicePresentable = r.resolve(ServicePresentable.self)
            playerPresenter.interactor = playerInteractor
            playerPresenter.wireframe = r.resolve(WireframeDelegate.self)
            return playerPresenter
        }
        
        container.register(ResultPresentable.self) { r in
            let resultPresenter = ResultPresenter()
            let resultInteractor = ResultInteractor()
            resultInteractor.resultPresentable = resultPresenter
            resultInteractor.servicePresentable = r.resolve(ServicePresentable.self)
            resultPresenter.interactor = resultInteractor
            return resultPresenter
        }
        
        container.register(ServicePresentable.self) { r in
            return DataService()
        }
        
        container.register(WireframeDelegate.self) { r in
            return Wireframe()
        }
        
        return container
    }
}

