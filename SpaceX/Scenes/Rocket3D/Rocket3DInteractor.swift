//
//  Rocket3DInteractor.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import UIKit

protocol Rocket3DPresentationLogic {
    func presentSomething(response: Rocket3D.UseCases.Response)
}

class Rocket3DInteractor: Rocket3DBusinessLogic, Rocket3DDataStore {
    
    var presenter: Rocket3DPresentationLogic?
    var rocketID: String!
    
    // MARK: Do something
    
    func doSomething(request: Rocket3D.UseCases.Request) {
        
        let response = Rocket3D.UseCases.Response()
        presenter?.presentSomething(response: response)
    }
}

