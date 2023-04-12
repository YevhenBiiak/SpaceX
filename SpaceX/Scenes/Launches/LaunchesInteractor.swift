//
//  LaunchesInteractor.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import Foundation

protocol LaunchesPresentationLogic {
    func presentLaunches(response: Launches.FetchLaunches.Response)
}

class LaunchesInteractor: LaunchesBusinessLogic, LaunchesDataStore {
    
    var presenter: LaunchesPresentationLogic?
    
    func fetchLaunches(request: Launches.FetchLaunches.Request) {
        
        SpacexAPI.fetchLaunches { [weak self] result in
            switch result {
            case .success(let apiLaunches):
                
                let launches: [Launches.Item] = apiLaunches.compactMap { launch in
                    let formatter = ISO8601DateFormatter()
                    
                    if let id = launch.id,
                       let mission = launch.mission_name,
                       let date = formatter.date(from: launch.launch_date_local ?? ""),
                       let images = launch.links?.flickr_images?.compactMap({$0}),
                       images.count > 0
                    {
                        let urls = images.compactMap({ URL(string: $0) })
                        return Launches.Item(id: id, date: date, mission: mission, imageURLs: urls)
                    } else {
                        return nil
                    }
                }
                
                let response = Launches.FetchLaunches.Response(launches: launches)
                self?.presenter?.presentLaunches(response: response)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
