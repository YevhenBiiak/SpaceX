//
//  RocketPresenter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

protocol RocketDisplayLogic: AnyObject {
    func display(viewModel: Rocket.FetchRocket.ViewModel)
}

class RocketPresenter: RocketPresentationLogic {
    
    weak var view: RocketDisplayLogic?
    
    func presentRocket(response: Rocket.FetchRocket.Response) {
        let rocket = response.rocket
        let images = getRocketImages(id: rocket.id)
        let payloads = parsePayloads(from: rocket.payloadWeights)
        
        let viewModel = Rocket.FetchRocket.ViewModel(
            id: rocket.id,
            rocketPhoto: images.rocketPhoto,
            rocketName: rocket.name,
            firstLaunch: rocket.firstFlight.formatted("yyyy"),
            costPerLaunch: "$\(rocket.costPerLaunch / 1000000) M",
            successRate: "\(Int(rocket.successRate)) %",
            rocketDescription: rocket.description,
            rocketImage: images.rocketImage,
            height: "\(rocket.height.meters) m / \(rocket.height.feet) ft",
            diameter: "\(rocket.diameter.meters) m / \(rocket.diameter.feet) ft",
            mass: "\(rocket.mass.kg) kg / \(rocket.mass.lb) lb",
            payloadToLEO: payloads.payloadToLEO,
            payloadToGTO: payloads.payloadToGTO,
            payloadToMars: payloads.payloadToMars,
            firstStage: .init(
                image: images.firstStageImage,
                name: getFirstStageName(id: rocket.id),
                isReusable: rocket.firstStage.isReusable,
                engines: "\(rocket.firstStage.engines.number) x \(rocket.firstStage.engines.type.uppercased())",
                propellantCapacity: "\(rocket.firstStage.propellantCapacity)",
                thrustToWeight: "\(rocket.firstStage.engines.thrustToWeight)",
                thrustSeaLevel: "\(rocket.firstStage.thrustSeaLevel.kN) kN / \(rocket.firstStage.thrustSeaLevel.lbf) lbf",
                thrustInVacuum: "\(rocket.firstStage.thrustInVacuum.kN) kN / \(rocket.firstStage.thrustInVacuum.lbf) lbf",
                landingLegs: rocket.firstStage.landingLegs.number == 0 ? "-" : "\(rocket.firstStage.landingLegs.number) x \(rocket.firstStage.landingLegs.material)"),
            secondStage: .init(
                image: images.secondStageImage,
                name: getSecondStageName(id: rocket.id),
                height: "\(rocket.secondStage.height.meters) m / \(rocket.secondStage.height.feet) ft",
                diameter: "\(rocket.secondStage.diameter.meters) m / \(rocket.secondStage.diameter.feet) ft",
                engines: "\(rocket.secondStage.engines)",
                propellantCapacit: "\(rocket.secondStage.propellantCapacit)",
                thrust: "\(rocket.secondStage.thrust.kN) kN / \(rocket.secondStage.thrust.lbf) lbf")
        )
        view?.display(viewModel: viewModel)
    }
    
    // MARK: - Private methods
    
    private func parsePayloads(from payloads: [Rocket.Model.Payload]) -> Payload {
        var payloadToLEO = "-"
        var payloadToGTO = "-"
        var payloadToMars = "-"
        
        if payloads.count > 0 { payloadToLEO  = "\(payloads[0].mass.kg) kg / \(payloads[0].mass.lb) lb" }
        if payloads.count > 1 { payloadToGTO  = "\(payloads[1].mass.kg) kg / \(payloads[1].mass.lb) lb" }
        if payloads.count > 2 { payloadToMars = "\(payloads[2].mass.kg) kg / \(payloads[2].mass.lb) lb" }
        
        return .init(payloadToLEO: payloadToLEO, payloadToGTO: payloadToGTO, payloadToMars: payloadToMars)
    }
    
    private func getRocketImages(id: String) -> RocketImages {
        switch id {
        case "5e9d0d95eda69955f709d1eb": // Falcon 1
            let rocketPhoto = UIImage(named: "falcon_1")
            let rocketImage = UIImage(named: "falcon_1_render")
            let firstStageImage = UIImage(named: "falcon_1_render")
            let secondStageImage = UIImage(named: "falcon_1_render")
            return RocketImages(
                rocketPhoto: rocketPhoto,
                rocketImage: rocketImage,
                firstStageImage: firstStageImage,
                secondStageImage: secondStageImage
            )
        case "5e9d0d95eda69973a809d1ec": // Falcon 9
            let rocketPhoto = UIImage(named: "falcon_9")
            let rocketImage = UIImage(named: "falcon_9_render")
            let firstStageImage = UIImage(named: "falcon_9_stage_1_render")
            let secondStageImage = UIImage(named: "falcon_payload_render")
            return RocketImages(
                rocketPhoto: rocketPhoto,
                rocketImage: rocketImage,
                firstStageImage: firstStageImage,
                secondStageImage: secondStageImage
            )
        case "5e9d0d95eda69974db09d1ed": // Falcon Heavy
            let rocketPhoto = UIImage(named: "falcon_heavy")
            let rocketImage = UIImage(named: "falcon_heavy_render")
            let firstStageImage = UIImage(named: "falcon_heavy_stage_1_render")
            let secondStageImage = UIImage(named: "falcon_payload_render")
            return RocketImages(
                rocketPhoto: rocketPhoto,
                rocketImage: rocketImage,
                firstStageImage: firstStageImage,
                secondStageImage: secondStageImage
            )
        case "5e9d0d96eda699382d09d1ee": // Starship
            let rocketPhoto = UIImage(named: "starship")
            let rocketImage = UIImage(named: "starship_render")
            let firstStageImage = UIImage(named: "super_heavy_render")
            let secondStageImage = UIImage(named: "spaceship_render")
            return RocketImages(
                rocketPhoto: rocketPhoto,
                rocketImage: rocketImage,
                firstStageImage: firstStageImage,
                secondStageImage: secondStageImage
            )
        default:
            return RocketImages()
        }
    }
    
    private func getFirstStageName(id: String) -> String {
        // if Starship
        id == "5e9d0d96eda699382d09d1ee"
            ? "SUPER HEAVY"
            : "FIRST STAGE"
    }
    
    private func getSecondStageName(id: String) -> String {
        // if Starship
        id == "5e9d0d96eda699382d09d1ee"
            ? "SPACESHIP"
            : "PAYLOAD"
    }
}

private struct Payload {
    let payloadToLEO: String
    let payloadToGTO: String
    let payloadToMars: String
}

private struct RocketImages {
    var rocketPhoto: UIImage?
    var rocketImage: UIImage?
    var firstStageImage: UIImage?
    var secondStageImage: UIImage?
}
