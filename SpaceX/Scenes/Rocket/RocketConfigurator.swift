//
//  RocketConfigurator.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import Foundation

struct RocketConfigurator {
    
    static func configure(with viewController: RocketViewController) {
        let interactor = RocketInteractor()
        let presenter = RocketPresenter()
        let router = RocketRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
