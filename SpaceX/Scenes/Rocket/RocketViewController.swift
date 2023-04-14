//
//  RocketViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

@objc protocol RocketRoutingLogic: NSObjectProtocol {
    func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol RocketBusinessLogic {
    func doSomething(request: Rocket.UseCases.Request)
}

class RocketViewController: UIViewController {
    
    @IBOutlet weak var mainImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var overviewImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var stage1ImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var stage2ImageViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var overviewImageView: UIImageView!
    @IBOutlet weak var stage1ImageView: UIImageView!
    @IBOutlet weak var stage2ImageView: UIImageView!
    
    var interactor: RocketBusinessLogic?
    var router: RocketRoutingLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        RocketConfigurator.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        RocketConfigurator.configure(with: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RocketConfigurator.configure(with: self)
        makeRequest()
        title = "FALCON 9"
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
        let request = Rocket.UseCases.Request()
        interactor?.doSomething(request: request)
    }
}

extension RocketViewController: RocketDisplayLogic {
    
    func display(viewModel: Rocket.UseCases.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

extension RocketViewController: UIScrollViewDelegate {
    var image: UIImage? {
        UIImage(named: "WebsiteF9Fairings_Render_Desktop")
    }
    
    var imageS1: UIImage? {
        UIImage(named: "F9S1")
    }
    
    var imageS2: UIImage? {
        UIImage(named: "falcon_payload")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset
        let pageHeight = scrollView.frame.height
        let page = scrollOffset.y / pageHeight
        
        if page < 1 {
            let heightConstant = -scrollOffset.y / (pageHeight / descriptionLabel.frame.height)
            mainImageConstraint.constant = scrollOffset.y
            mainImageHeightConstraint.constant = heightConstant
        } else if (2...3).contains(page) {
            let constant = scrollOffset.y - 2 * pageHeight
            overviewImageConstraint.constant = constant
            overviewImageView.image = image?.blurred(radius: 15 * constant / pageHeight)
            overviewImageView.alpha = 1 - constant / pageHeight + 0.5
        } else if (4...5).contains(page) {
            let constant = scrollOffset.y - 4 * pageHeight
            stage1ImageViewConstraint.constant = constant
            stage1ImageView.image = imageS1?.blurred(radius: 15 * constant / pageHeight)
            stage1ImageView.alpha = 1 - constant / pageHeight + 0.5
        } else if (6...7).contains(page) {
            let constant = scrollOffset.y - 6 * pageHeight
            stage2ImageViewConstraint.constant = constant
            stage2ImageView.image = imageS2?.blurred(radius: 15 * constant / pageHeight)
            stage2ImageView.alpha = 1 - constant / pageHeight + 0.5
        }
        
        UIView.performWithoutAnimation {
            self.view.layoutIfNeeded()
        }
    }
    
}
