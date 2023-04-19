//
//  RocketInteractor.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

protocol RocketPresentationLogic {
    func presentRocket(response: Rocket.FetchRocket.Response)
}

class RocketInteractor: RocketBusinessLogic, RocketDataStore {
    
    var presenter: RocketPresentationLogic?
    var rocketID: String!
    
    func fetchRocket(request: Rocket.FetchRocket.Request) {
        
        SpacexAPI.fetchRocket(id: rocketID) { [weak self] result in
            switch result {
            case .success(let apiRocket):
                
                let firstStage = Rocket.Model.FirstStage(
                    isReusable: apiRocket?.first_stage?.reusable ?? false,
                    engines: .init(
                        number: apiRocket?.engines?.number ?? 0,
                        thrustToWeight: apiRocket?.engines?.thrust_to_weight ?? 0,
                        type: apiRocket?.engines?.type ?? ""),
                    propellantCapacity: apiRocket?.first_stage?.fuel_amount_tons ?? 0,
                    thrustSeaLevel: .init(
                        kN: Int(apiRocket?.first_stage?.thrust_sea_level?.kN ?? 0),
                        lbf: Int(apiRocket?.first_stage?.thrust_sea_level?.lbf ?? 0)),
                    thrustInVacuum: .init(
                        kN: Int(apiRocket?.first_stage?.thrust_vacuum?.kN ?? 0),
                        lbf: Int(apiRocket?.first_stage?.thrust_vacuum?.kN ?? 0)),
                    landingLegs: .init(
                        material: apiRocket?.landing_legs?.material ?? "",
                        number: apiRocket?.landing_legs?.number ?? 0)
                )
                
                let secondStage = Rocket.Model.SecondStage(
                    height: .init(
                        feet:  apiRocket?.second_stage?.payloads?.composite_fairing?.height?.feet ?? 0,
                        meters: apiRocket?.second_stage?.payloads?.composite_fairing?.height?.meters ?? 0),
                    diameter: .init(
                        feet: apiRocket?.second_stage?.payloads?.composite_fairing?.diameter?.feet ?? 0,
                        meters: apiRocket?.second_stage?.payloads?.composite_fairing?.diameter?.meters ?? 0),
                    engines: apiRocket?.second_stage?.engines ?? 0,
                    propellantCapacit: apiRocket?.second_stage?.fuel_amount_tons ?? 0,
                    thrust: .init(
                        kN: Int(apiRocket?.second_stage?.thrust?.kN ?? 0),
                        lbf: Int(apiRocket?.second_stage?.thrust?.lbf ?? 0)),
                    option: apiRocket?.second_stage?.payloads?.option_1 ?? ""
                )
                
                let payloads: [Rocket.Model.Payload] = apiRocket?.payload_weights?.compactMap { payload in
                    if let name = payload?.name,
                       let massKG = payload?.kg,
                       let massLB = payload?.lb
                    {
                        return Rocket.Model.Payload(
                            name: name,
                            mass: .init(
                                kg: massKG,
                                lb: massLB
                            )
                        )
                    } else {
                        return nil
                    }
                } ?? []
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                let rocket = Rocket.Model(
                    id:            apiRocket?.id ?? "",
                    name:          apiRocket?.name ?? "",
                    active:        apiRocket?.active ?? false,
                    firstFlight:   dateFormatter.date(from: apiRocket?.first_flight ?? "") ?? Date(),
                    costPerLaunch: apiRocket?.cost_per_launch ?? 0,
                    successRate:   apiRocket?.success_rate_pct ?? 0,
                    description:   apiRocket?.description ?? "",
                    height: .init(
                        feet:   apiRocket?.height?.feet ?? 0,
                        meters: apiRocket?.height?.meters ?? 0
                    ),
                    diameter: .init(
                        feet:   apiRocket?.diameter?.feet ?? 0,
                        meters: apiRocket?.diameter?.meters ?? 0
                    ),
                    mass: .init(
                        kg: apiRocket?.mass?.kg ?? 0,
                        lb: apiRocket?.mass?.lb ?? 0
                    ),
                    payloadWeights: payloads,
                    firstStage: firstStage,
                    secondStage: secondStage,
                    wikipedia: apiRocket?.wikipedia ?? ""
                )
                
                let response = Rocket.FetchRocket.Response(rocket: rocket)
                self?.presenter?.presentRocket(response: response)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

