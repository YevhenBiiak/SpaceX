//
//  LaunchesConfigurator.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import Foundation

struct LaunchesConfigurator {
    
    static func configure(with viewController: LaunchesViewController) {
        let interactor = LaunchesInteractor()
        let presenter = LaunchesPresenter()
        let router = LaunchesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
