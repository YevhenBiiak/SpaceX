//
//  Rocket3DConfigurator.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import Foundation

struct Rocket3DConfigurator {
    
    static func configure(with viewController: Rocket3DViewController) {
        let interactor = Rocket3DInteractor()
        let presenter = Rocket3DPresenter()
        let router = Rocket3DRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
