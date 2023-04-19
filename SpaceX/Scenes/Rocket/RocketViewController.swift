//
//  RocketViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

@objc protocol RocketRoutingLogic: NSObjectProtocol {
    func routeToRocket3D(segue: UIStoryboardSegue?)
}

protocol RocketBusinessLogic {
    func fetchRocket(request: Rocket.FetchRocket.Request)
}

class RocketViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Constraints
    @IBOutlet weak var mainImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var overviewImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstStageImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondStageImageTopConstraint: NSLayoutConstraint!
    
    // main page
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var firstLaunchLabel: UILabel!
    @IBOutlet weak var costPerLaunchLabel: UILabel!
    @IBOutlet weak var successRateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // overview page
    @IBOutlet weak var overviewImageView: UIImageView!
    @IBOutlet weak var rocketHeightLabel: UILabel!
    @IBOutlet weak var rocketDiameterLabel: UILabel!
    @IBOutlet weak var rocketMassLabel: UILabel!
    @IBOutlet weak var payloadToLEOLabel: UILabel!
    @IBOutlet weak var payloadToGTOLabel: UILabel!
    @IBOutlet weak var payloadToMarsLabel: UILabel!
    
    // first stage page
    @IBOutlet weak var firstStageImageView: UIImageView!
    @IBOutlet weak var firstStageNameLabel: UILabel!
    @IBOutlet weak var reusableStageLabel: UILabel!
    @IBOutlet weak var firstStageEnginesLabel: UILabel!
    @IBOutlet weak var firstStagePropellantCapacityLabel: UILabel!
    @IBOutlet weak var firstStageThrustToWeightLabel: UILabel!
    @IBOutlet weak var firstStageThrustSeaLevelLabel: UILabel!
    @IBOutlet weak var firstStageThrustInVacuumLabel: UILabel!
    @IBOutlet weak var firstStageLandingLegsLabel: UILabel!
    
    // second stage page
    @IBOutlet weak var secondStageImageView: UIImageView!
    @IBOutlet weak var secondStageNameLabel: UILabel!
    @IBOutlet weak var secondStageHeightLabel: UILabel!
    @IBOutlet weak var secondStageDiameterLabel: UILabel!
    @IBOutlet weak var secondStageEnginesLabel: UILabel!
    @IBOutlet weak var secondStagePropellantCapacityLabel: UILabel!
    @IBOutlet weak var secondStageThrustLabel: UILabel!
    
    @IBOutlet weak var chevronUp: UIImageView!
    @IBOutlet weak var chevronDown: UIImageView!
    
    private var titleLabel: UILabel!
    private let activityIndicator = ActivityIndicatorView()
    
    var interactor: RocketBusinessLogic?
    var router: RocketRoutingLogic?
    
    var viewModel: Rocket.FetchRocket.ViewModel?
    
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
        addActivityIndicator()
        
        fetchRocket()
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
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {}
    
    // MARK: Private methods
    
    private func fetchRocket() {
        let request = Rocket.FetchRocket.Request()
        interactor?.fetchRocket(request: request)
        activityIndicator.startAnimating()
        scrollView.isHidden = true
    }
    
    private func addActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension RocketViewController: RocketDisplayLogic {
    
    func display(viewModel: Rocket.FetchRocket.ViewModel) {
        scrollView.isHidden = false
        activityIndicator.stopAnimating()
        self.viewModel = viewModel
        
        // main page
        title = viewModel.rocketName
        mainImageView.image = viewModel.rocketPhoto
        firstLaunchLabel.text = viewModel.firstLaunch
        costPerLaunchLabel.text = viewModel.costPerLaunch
        successRateLabel.text = viewModel.successRate
        descriptionLabel.text = viewModel.rocketDescription

        // overview page
        overviewImageView.image = viewModel.rocketImage
        rocketHeightLabel.text = viewModel.height
        rocketDiameterLabel.text = viewModel.diameter
        rocketMassLabel.text = viewModel.mass
        payloadToLEOLabel.text = viewModel.payloadToLEO
        payloadToGTOLabel.text = viewModel.payloadToGTO
        payloadToMarsLabel.text = viewModel.payloadToMars

        // first stage page
        firstStageImageView.image = viewModel.firstStage.image
        firstStageNameLabel.text = viewModel.firstStage.name
        reusableStageLabel.isHidden = !viewModel.firstStage.isReusable
        firstStageEnginesLabel.text = viewModel.firstStage.engines
        firstStagePropellantCapacityLabel.text = viewModel.firstStage.propellantCapacity
        firstStageThrustToWeightLabel.text = viewModel.firstStage.thrustToWeight
        firstStageThrustSeaLevelLabel.text = viewModel.firstStage.thrustSeaLevel
        firstStageThrustInVacuumLabel.text = viewModel.firstStage.thrustInVacuum
        firstStageLandingLegsLabel.text = viewModel.firstStage.landingLegs

        // seccond stage page
        secondStageImageView.image = viewModel.secondStage.image
        secondStageNameLabel.text = viewModel.secondStage.name
        secondStageHeightLabel.text = viewModel.secondStage.height
        secondStageDiameterLabel.text = viewModel.secondStage.diameter
        secondStageEnginesLabel.text = viewModel.secondStage.engines
        secondStagePropellantCapacityLabel.text = viewModel.secondStage.propellantCapacit
        secondStageThrustLabel.text = viewModel.secondStage.thrust
    }
}

extension RocketViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset
        let pageHeight = scrollView.frame.height
        let page = scrollOffset.y / pageHeight

        if page < 1 {
            let heightConstant = -scrollOffset.y / (pageHeight / descriptionLabel.frame.height)
            mainImageTopConstraint.constant = scrollOffset.y
            mainImageHeightConstraint.constant = heightConstant
        } else if (2...3).contains(page) {
            let constant = scrollOffset.y - 2 * pageHeight
            overviewImageTopConstraint.constant = constant
            overviewImageView.image = viewModel?.rocketImage?.blurred(radius: 15 * constant / pageHeight)
            overviewImageView.alpha = 1 - constant / pageHeight + 0.5
        } else if (4...5).contains(page) {
            let constant = scrollOffset.y - 4 * pageHeight
            firstStageImageTopConstraint.constant = constant
            firstStageImageView.image = viewModel?.firstStage.image?.blurred(radius: 15 * constant / pageHeight)
            firstStageImageView.alpha = 1 - constant / pageHeight + 0.5
        } else if (6...7).contains(page) {
            let constant = scrollOffset.y - 6 * pageHeight
            secondStageImageTopConstraint.constant = constant
            secondStageImageView.image = viewModel?.secondStage.image?.blurred(radius: 15 * constant / pageHeight)
            secondStageImageView.alpha = 1 - constant / pageHeight + 0.5
        }
        
        chevronUp.isHidden = page <= 1.5 ? true : false
        chevronDown.isHidden = page >= 6.5 ? true : false

        UIView.performWithoutAnimation {
            self.view.layoutIfNeeded()
        }
    }
}
