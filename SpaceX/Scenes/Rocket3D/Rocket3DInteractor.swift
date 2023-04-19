//
//  Rocket3DInteractor.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import UIKit

protocol Rocket3DPresentationLogic {
    func present3DModel(response: Rocket3D.Show3DModel.Response)
}

class Rocket3DInteractor: Rocket3DBusinessLogic, Rocket3DDataStore {
    
    var presenter: Rocket3DPresentationLogic?
    var rocketID: String!
    
    func show3DModel(request: Rocket3D.Show3DModel.Request) {
        let filename: String
        switch rocketID {
        case "5e9d0d95eda69955f709d1eb": // Falcon 1
            filename = "falcon_1.scn"
        case "5e9d0d95eda69973a809d1ec": // Falcon 9
            filename = "falcon_9.scn"
        case "5e9d0d95eda69974db09d1ed": // Falcon Heavy
            filename = "falcon_heavy.scn"
        case "5e9d0d96eda699382d09d1ee": // Starship
            filename = "starship.scn"
        default:
            filename = ""
        }
        
        let response = Rocket3D.Show3DModel.Response(filename: filename)
        presenter?.present3DModel(response: response)
    }
}
