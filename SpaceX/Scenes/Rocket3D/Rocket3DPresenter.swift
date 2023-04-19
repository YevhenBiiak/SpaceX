//
//  Rocket3DPresenter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import UIKit

protocol Rocket3DDisplayLogic: AnyObject {
    func display(viewModel: Rocket3D.Show3DModel.ViewModel)
}

class Rocket3DPresenter: Rocket3DPresentationLogic {
    
    weak var view: Rocket3DDisplayLogic?
    
    func present3DModel(response: Rocket3D.Show3DModel.Response) {
        
        let viewModel = Rocket3D.Show3DModel.ViewModel(filename: response.filename)
        view?.display(viewModel: viewModel)
    }
}
