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
    
    func fetchItems(request: Home.FetchItems.Request) {
        
        SpacexAPI.fetchRockets { [weak self] result in
            switch result {
            case .success(let apiRockets):
                let items: [Home.Model] = apiRockets.compactMap { rocket in
                    guard let id = rocket.id,
                          let name = rocket.name,
                          let description = rocket.description
                    else { return nil }
                    
                    return Home.Model(id: id, name: name, description: description)
                }
                
                let response = Home.FetchItems.Response(items: items)
                self?.presenter?.presentItems(response: response)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
