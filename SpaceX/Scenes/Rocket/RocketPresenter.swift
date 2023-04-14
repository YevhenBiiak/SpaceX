//
//  RocketPresenter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

protocol RocketDisplayLogic: AnyObject {
    func display(viewModel: Rocket.UseCases.ViewModel)
}

class RocketPresenter: RocketPresentationLogic {
    
    weak var view: RocketDisplayLogic?
    
    func presentSomething(response: Rocket.UseCases.Response) {
        
        let viewModel = Rocket.UseCases.ViewModel()
        view?.display(viewModel: viewModel)
    }
}
