//
//  HomeRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import Foundation

protocol HomeDataStore {
    var items: [Item] { get }
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject {
    
}
