//
//  HomeConfigurator.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import Foundation

struct HomeConfigurator {
    
    static func configure(with viewController: HomeViewController) {
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
