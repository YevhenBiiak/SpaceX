//
//  LaunchDetailsPresenter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import UIKit

protocol LaunchDetailsDisplayLogic: AnyObject {
    func display(viewModel: LaunchDetails.ShowLaunch.ViewModel)
}

class LaunchDetailsPresenter: LaunchDetailsPresentationLogic {
    
    weak var view: LaunchDetailsDisplayLogic?
    
    func presentLaunch(response: LaunchDetails.ShowLaunch.Response) {
        let launch = response.launch
        let rocketImage = getRocketImage(byID: launch.rocket.id)
        let viewModel = LaunchDetails.ShowLaunch.ViewModel(
            id: launch.id,
            date: launch.date.formatted("MMMM d, yyyy"),
            upcoming: launch.upcoming,
            mission: launch.mission,
            description: launch.description,
            rocket: .init(
                id: launch.rocket.id,
                name: launch.rocket.name,
                description: launch.rocket.description,
                height: "\(String(format: "%.2f", launch.rocket.height)) m",
                diameter: "\(String(format: "%.2f", launch.rocket.diameter)) m",
                mass: "\(launch.rocket.mass) kg",
                image: rocketImage
            ),
            imageURLs: launch.imageURLs
        )
        view?.display(viewModel: viewModel)
    }
    
    private func getRocketImage(byID id: String) -> UIImage {
        switch id {
        case "5e9d0d95eda69955f709d1eb":
            return UIImage(named: "falcon_1_png")!
        case "5e9d0d95eda69973a809d1ec":
            return UIImage(named: "falcon_9_png")!
        case "5e9d0d95eda69974db09d1ed":
            return UIImage(named: "falcon_heavy_png")!
        default: return UIImage()
        }
    }
}
