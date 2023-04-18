//
//  LaunchDetailsViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import UIKit

@objc protocol LaunchDetailsRoutingLogic: NSObjectProtocol {
    func routeToRocket(segue: UIStoryboardSegue?)
}

protocol LaunchDetailsBusinessLogic {
    func showLaunch(request: LaunchDetails.ShowLaunch.Request)
}

class LaunchDetailsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var rocketDescription: UILabel!
    @IBOutlet weak var rocketHeight: UILabel!
    @IBOutlet weak var rocketDiameter: UILabel!
    @IBOutlet weak var rocketMass: UILabel!
    @IBOutlet weak var rocketButton: UIButton!
    
    var interactor: LaunchDetailsBusinessLogic?
    var router: LaunchDetailsRoutingLogic?
    
    private var viewModel: LaunchDetails.ShowLaunch.ViewModel?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        LaunchDetailsConfigurator.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        LaunchDetailsConfigurator.configure(with: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        configureCollectinView()
        showLaunch()
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
    
    private func showLaunch() {
        let request = LaunchDetails.ShowLaunch.Request()
        interactor?.showLaunch(request: request)
    }
    
    private func configureCollectinView() {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: section)
    }
}

extension LaunchDetailsViewController: LaunchDetailsDisplayLogic {
    
    func display(viewModel: LaunchDetails.ShowLaunch.ViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
        dateLabel.text = viewModel.date.uppercased()
        upcomingLabel.isHidden = !viewModel.upcoming
        missionNameLabel.text = viewModel.mission.uppercased()
        
        rocketImageView.image = viewModel.rocket.image
        rocketName.text = viewModel.rocket.name.uppercased()
        rocketDescription.text = viewModel.rocket.description
        rocketHeight.text = viewModel.rocket.height
        rocketDiameter.text = viewModel.rocket.diameter
        rocketMass.text = viewModel.rocket.mass
    }
}

extension LaunchDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.imageURLs.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchImageCell.reuseId, for: indexPath)
        
        (cell as? LaunchImageCell)?.imageURL = viewModel?.imageURLs[indexPath.item]
        
        return cell
    }
}
