//
//  Rocket3DViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import UIKit

@objc protocol Rocket3DRoutingLogic: NSObjectProtocol {}

protocol Rocket3DBusinessLogic {
    func doSomething(request: Rocket3D.UseCases.Request)
}

class Rocket3DViewController: UIViewController {
    
    var interactor: Rocket3DBusinessLogic?
    var router: Rocket3DRoutingLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        Rocket3DConfigurator.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Rocket3DConfigurator.configure(with: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Rocket3DConfigurator.configure(with: self)
        makeRequest()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    private func makeRequest() {
        let request = Rocket3D.UseCases.Request()
        interactor?.doSomething(request: request)
    }
}

extension Rocket3DViewController: Rocket3DDisplayLogic {
    
    func display(viewModel: Rocket3D.UseCases.ViewModel) {
        
    }
}

