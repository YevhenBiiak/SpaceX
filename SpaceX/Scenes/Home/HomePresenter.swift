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
            UIImage(named: "falcon_1")!,
            UIImage(named: "falcon_9")!,
            UIImage(named: "falcon_heavy")!,
            UIImage(named: "starship")!
        ]
        
        var viewModels: [Home.FetchItems.ViewModel] = []
        
        // set images for rockets
        for (i, item) in response.items.enumerated() {
            viewModels.append(
                Home.FetchItems.ViewModel(
                    id: item.id,
                    title: item.name,
                    description: item.description,
                    image: i < images.count ? images[i] : UIImage()
                )
            )
        }
        
        // add Launches
        viewModels.append(contentsOf: [
            Home.FetchItems.ViewModel(
                id: "",
                title: "Launches",
                description: "All information about the latest launches and missions of SpaceX. From historic first launches, such as the Falcon Heavy rocket, to regular deliveries to the International Space Station, SpaceX is pushing the boundaries of what is possible in space exploration and travel.",
                image: UIImage(named: "launches")!
            )
        ])
        
        view?.display(items: viewModels)
    }
}
