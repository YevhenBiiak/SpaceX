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
        
        // add Missions and Launches
        viewModels.append(contentsOf: [
            Home.FetchItems.ViewModel(
                id: "",
                title: "Missions",
                description: "\"You want to wake up in the morning and think the future is going to be great - and that’s what being a spacefaring civilization is all about. It’s about believing in the future and thinking that the future will be better than the past. And I can’t think of anything more exciting than going out there and being among the stars.\" - Elon Musk",
                image: UIImage(named: "missions")!
            ),
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
