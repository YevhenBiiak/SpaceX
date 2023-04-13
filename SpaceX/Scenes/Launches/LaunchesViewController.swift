//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import UIKit

@objc protocol LaunchesRoutingLogic: NSObjectProtocol {
    func routeToLaunchDetails(segue: UIStoryboardSegue?)
}

protocol LaunchesBusinessLogic {
    func fetchLaunches(request: Launches.FetchLaunches.Request)
}

class LaunchesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var interactor: LaunchesBusinessLogic?
    var router: LaunchesRoutingLogic?
    
    private var viewModels: [Launches.FetchLaunches.ViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        configureCollectinView()
        
        LaunchesConfigurator.configure(with: self)
        
        let request = Launches.FetchLaunches.Request()
        interactor?.fetchLaunches(request: request)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    private func configureCollectinView() {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(0.4875),
            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.5)),
            subitems: [item])
        
        group.interItemSpacing = .flexible(1)
        group.edgeSpacing = .init(leading: .fixed(0), top: .fixed(0),
                                  trailing: .fixed(0), bottom: .fixed(16))
        
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(
            section: .init(group: group))
    }
    
}

extension LaunchesViewController: LaunchesDisplayLogic {
    
    func display(viewModels: [Launches.FetchLaunches.ViewModel]) {
        self.viewModels = viewModels
        collectionView.reloadData()
    }
}

extension LaunchesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchViewCell.reuseId, for: indexPath)
        
        (cell as? LaunchViewCell)?.viewModel = viewModels[indexPath.row]
        
        return cell
    }
    
}
