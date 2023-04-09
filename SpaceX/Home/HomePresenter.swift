//
//  HomePresenter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func display(items: [Home.FetchItems.ViewModel])
}

class HomePresenter: HomePresentationLogic {
    
    weak var view: HomeDisplayLogic?
    
    func presentItems(response: Home.FetchItems.Response) {
        let images = [
            UIImage(named: "falcon_1_launch")!,
            UIImage(named: "falcon_9_launch")!,
            UIImage(named: "falcon_heavy_launch")!,
            UIImage(named: "missions")!,
            UIImage(named: "launches")!
        ]
        
        var viewModels: [Home.FetchItems.ViewModel] = []
        for (i, item) in response.items.enumerated() {
            viewModels.append(.init(
                title: item.title,
                description: "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.",
                image: images[i]
            ))
        }
        
        view?.display(items: viewModels)
    }
}
