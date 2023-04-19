//
//  SplashViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpacexAPI.fetchRockets { [weak self] _ in
            self?.performSegue(withIdentifier: "Home", sender: nil)
        }
    }
    
}
