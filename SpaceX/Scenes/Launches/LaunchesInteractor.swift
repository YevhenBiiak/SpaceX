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
    
    var launches: [Launch] = []
    
    func fetchLaunches(request: Launches.FetchLaunches.Request) {
        
        SpacexAPI.fetchLaunches { [weak self] result in
            switch result {
            case .success(let apiLaunches):
                
                let launches: [Launch] = apiLaunches.compactMap { launch in
                    let formatter = ISO8601DateFormatter()
                    
                    if let id = launch.id,
                       let mission = launch.mission_name,
                       let date = formatter.date(from: launch.launch_date_local ?? ""),
                       let upcoming = launch.upcoming,
                       let description = launch.details,
                       let rocketID = launch.rocket?.rocket?.id,
                       let rocketName = launch.rocket?.rocket?.name,
                       let rocketDescription = launch.rocket?.rocket?.description,
                       let rocketHeight = launch.rocket?.rocket?.height?.meters,
                       let rocketDiameter = launch.rocket?.rocket?.diameter?.meters,
                       let rocketMass = launch.rocket?.rocket?.mass?.kg,
                       let images = launch.links?.flickr_images?.compactMap({$0}),
                       images.count > 0
                    {
                        return Launch(
                            id: id,
                            date: date,
                            upcoming: upcoming,
                            mission: mission,
                            description: description,
                            rocket: Launch.Rocket(
                                id: rocketID,
                                name: rocketName,
                                description: rocketDescription,
                                height: rocketHeight,
                                diameter: rocketDiameter,
                                mass: rocketMass
                            ),
                            imageURLs: images.compactMap({ URL(string: $0) })
                        )
                    } else {
                        return nil
                    }
                }
                self?.launches = launches
                
                let response = Launches.FetchLaunches.Response(launches: launches)
                self?.presenter?.presentLaunches(response: response)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
