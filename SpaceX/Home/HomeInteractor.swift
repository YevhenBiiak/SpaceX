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
            case .success(let rockets):
                let items: [Home.Item] = rockets.compactMap { rocket in
                    rocket.id != nil && rocket.name != nil && rocket.description != nil
                        ? Home.Item(id: rocket.id!, name: rocket.name!, description: rocket.description!)
                        : nil
                }
                
                let response = Home.FetchItems.Response(items: items)
                self?.presenter?.presentItems(response: response)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
