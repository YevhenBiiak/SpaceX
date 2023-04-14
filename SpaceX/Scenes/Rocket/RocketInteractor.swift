//
//  RocketInteractor.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

protocol RocketPresentationLogic {
    func presentSomething(response: Rocket.UseCases.Response)
}

class RocketInteractor: RocketBusinessLogic, RocketDataStore {
    
    var presenter: RocketPresentationLogic?
    var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: Rocket.UseCases.Request) {
        
        let response = Rocket.UseCases.Response()
        presenter?.presentSomething(response: response)
    }
}

