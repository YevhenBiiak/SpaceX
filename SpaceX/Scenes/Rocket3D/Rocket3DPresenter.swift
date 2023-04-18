//
//  Rocket3DPresenter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import UIKit

protocol Rocket3DDisplayLogic: AnyObject {
    func display(viewModel: Rocket3D.UseCases.ViewModel)
}

class Rocket3DPresenter: Rocket3DPresentationLogic {
    
    weak var view: Rocket3DDisplayLogic?
    
    func presentSomething(response: Rocket3D.UseCases.Response) {
        
        let viewModel = Rocket3D.UseCases.ViewModel()
        view?.display(viewModel: viewModel)
    }
}
