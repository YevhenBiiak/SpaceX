//
//  HomeInteractor.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import Foundation

protocol HomePresentationLogic {
    func presentItems(response: Home.FetchItems.Response)
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    var presenter: HomePresentationLogic?
    
    var rockets: [Home.Rocket] = []
    
    func fetchItems(request: Home.FetchItems.Request) {
        
        SpacexAPI.fetchRockets { [weak self] result in
            switch result {
            case .success(let apiRockets):
                self?.rockets = apiRockets.compactMap { rocket in
                    guard let id = rocket.id,
                          let name = rocket.name,
                          let description = rocket.description
                    else { return nil }
                    
                    return Home.Rocket(id: id, name: name, description: description)
                }
                
                let response = Home.FetchItems.Response(items: self?.rockets ?? [])
                self?.presenter?.presentItems(response: response)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
