//
//  Rocket3DViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import UIKit
import SceneKit

@objc protocol Rocket3DRoutingLogic: NSObjectProtocol {}

protocol Rocket3DBusinessLogic {
    func show3DModel(request: Rocket3D.Show3DModel.Request)
}

class Rocket3DViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    private let activityIndicator = ActivityIndicatorView()
    
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
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActivityIndicator()
        activityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        show3DModel()
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
    
    private func show3DModel() {
        let request = Rocket3D.Show3DModel.Request()
        interactor?.show3DModel(request: request)
    }
    
    private func addActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension Rocket3DViewController: Rocket3DDisplayLogic {
    
    func display(viewModel: Rocket3D.Show3DModel.ViewModel) {
        let scene = SCNScene(named: viewModel.filename)
        
        // Add light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene?.rootNode.addChildNode(lightNode)
        
        // Allow user to manipulate camera
        self.sceneView.allowsCameraControl = true
        
        // Set scene settings
        self.sceneView.scene = scene
        
        activityIndicator.stopAnimating()
    }
}

