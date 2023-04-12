//
//  LaunchesPresenter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import UIKit

protocol LaunchesDisplayLogic: AnyObject {
    func display(launches: [Launches.FetchLaunches.ViewModel])
}

class LaunchesPresenter: LaunchesPresentationLogic {
    
    weak var view: LaunchesDisplayLogic?
    
    func presentLaunches(response: Launches.FetchLaunches.Response) {
        let viewModels = response.launches.map { launch in
            let date = launch.date.formatted("MMMM d, yyyy")
            let imageURL = launch.imageURLs.first
            
            return Launches.FetchLaunches.ViewModel(id: launch.id, date: date, title: launch.mission, imageURL: imageURL)
        }
        
        view?.display(launches: viewModels)
    }
}
