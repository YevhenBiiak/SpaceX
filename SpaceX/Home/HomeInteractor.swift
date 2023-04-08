//
//  HomeInteractor.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import Foundation

protocol SpacexAPI {
    func fetchRockets(_ completion: ([String]) -> Void)
}

protocol HomePresentationLogic {
    func presentItems(response: Home.FetchItems.Response)
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    var presenter: HomePresentationLogic?
    
    var spacexAPI: SpacexAPI?
    
    func fetchItems(request: Home.FetchItems.Request) {
        spacexAPI?.fetchRockets { rockets in
            
        }
        let array = [
            Home.Item(title: "Falcon 1"),
            Home.Item(title: "Falcon 9"),
            Home.Item(title: "Falcon heavy"),
            Home.Item(title: "Missions"),
            Home.Item(title: "Launches")
        ]
        let response = Home.FetchItems.Response(items: array)
        
        presenter?.presentItems(response: response)
    }
}
