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
    
    private var launches: [Launches.FetchLaunches.ViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectinView()
        
        LaunchesConfigurator.configure(with: self)
        
        let request = Launches.FetchLaunches.Request()
        interactor?.fetchLaunches(request: request)
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
    
    func display(launches: [Launches.FetchLaunches.ViewModel]) {
        self.launches = launches
        collectionView.reloadData()
    }
}

extension LaunchesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        launches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchViewCell.reuseId, for: indexPath)
        
        (cell as? LaunchViewCell)?.viewModel = launches[indexPath.row]
        
        return cell
    }
    
}

extension LaunchesViewController: UICollectionViewDelegate {
    
}
