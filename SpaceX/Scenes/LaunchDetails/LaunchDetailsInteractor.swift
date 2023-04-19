//
//  LaunchDetailsInteractor.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import UIKit

protocol LaunchDetailsPresentationLogic {
    func presentLaunch(response: LaunchDetails.ShowLaunch.Response)
}

class LaunchDetailsInteractor: LaunchDetailsBusinessLogic, LaunchDetailsDataStore {
    
    var presenter: LaunchDetailsPresentationLogic?
    var launch: Launch!
        
    func showLaunch(request: LaunchDetails.ShowLaunch.Request) {
        
        let response = LaunchDetails.ShowLaunch.Response(launch: launch)
        presenter?.presentLaunch(response: response)
    }
}
