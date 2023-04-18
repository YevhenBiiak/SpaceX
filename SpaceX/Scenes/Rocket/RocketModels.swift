//
//  RocketModels.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

enum Rocket {
    
    struct Model {
        struct Distance {
            let feet: Double
            let meters: Double
        }
        struct Mass {
            let kg: Int
            let lb: Int
        }
        struct Payload {
            let name: String
            let mass: Mass
        }
        struct Force {
            let kN: Int
            let lbf: Int
        }
        struct FirstStage {
            struct LandingLegs {
                let material: String
                let number: Int
            }
            struct Engines {
                let number: Int
                let thrustToWeight: Double
                let type: String
            }
            let isReusable: Bool
            let engines: Engines
            let propellantCapacity: Double
            let thrustSeaLevel: Force
            let thrustInVacuum: Force
            let landingLegs: LandingLegs
        }
        struct SecondStage {
            let height: Distance
            let diameter: Distance
            let engines: Int
            let propellantCapacit: Double
            let thrust: Force
            let option: String
        }
        let id: String
        let name: String
        let active: Bool
        let firstFlight: Date
        let costPerLaunch: Int
        let successRate: Int
        let description: String
        let height: Distance
        let diameter: Distance
        let mass: Mass
        let payloadWeights: [Payload]
        let firstStage: FirstStage
        let secondStage: SecondStage
        let wikipedia: String
    }
    
    // MARK: Use cases
    
    enum FetchRocket {
        struct Request {}
        struct Response {
            let rocket: Model
        }
        struct ViewModel {
            struct FirstStage {
                let image: UIImage?
                let name: String
                let isReusable: Bool
                let engines: String
                let propellantCapacity: String
                let thrustToWeight: String
                let thrustSeaLevel: String
                let thrustInVacuum: String
                let landingLegs: String
            }
            struct SecondStage {
                let image: UIImage?
                let name: String
                let height: String
                let diameter: String
                let engines: String
                let propellantCapacit: String
                let thrust: String
            }
            let id: String
            let rocketPhoto: UIImage?
            let rocketName: String
            let firstLaunch: String
            let costPerLaunch: String
            let successRate: String
            let rocketDescription: String
            let rocketImage: UIImage?
            let height: String
            let diameter: String
            let mass: String
            let payloadToLEO: String
            let payloadToGTO: String
            let payloadToMars: String
            let firstStage: FirstStage
            let secondStage: SecondStage
        }
    }
}
