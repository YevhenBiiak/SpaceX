//
//  LaunchDetailsConfigurator.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import Foundation

struct LaunchDetailsConfigurator {
    
    static func configure(with viewController: LaunchDetailsViewController) {
        let interactor = LaunchDetailsInteractor()
        let presenter = LaunchDetailsPresenter()
        let router = LaunchDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
