//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 05.04.2023.
//

import UIKit

@objc protocol HomeRoutingLogic: NSObjectProtocol {
    func routeToRocket(segue: UIStoryboardSegue?)
    func routeToMissions(segue: UIStoryboardSegue?)
    func routeToLaunches(segue: UIStoryboardSegue?)
}

protocol HomeBusinessLogic {
    func fetchItems(request: Home.FetchItems.Request)
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: HomeBusinessLogic?
    var router: HomeRoutingLogic?
    
    private var items: [Home.FetchItems.ViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        addLogoImage()
        
        HomeConfigurator.configure(with: self)
        
        let request = Home.FetchItems.Request()
        interactor?.fetchItems(request: request)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    private func setBackgroundImage() {
        let image = UIImage(named: "spacex_bg")?.blurred(radius: 15)
        view.layer.contents = image?.cgImage
        view.layer.contentsGravity = .resizeAspectFill
    }
    
    private func addLogoImage() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        let logo = UIImage(named: "spacex_logo")!
        let imageView = UIImageView(image: logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(greaterThanOrEqualTo: navigationBar.widthAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(lessThanOrEqualTo: navigationBar.heightAnchor, multiplier: 5),
            imageView.widthAnchor.constraint(lessThanOrEqualTo: navigationBar.widthAnchor, multiplier: 0.8),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: logo.aspectRation),
            imageView.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor, constant: navigationBar.frame.width * 0.055),
            imageView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor, constant: -8)
        ])
    }
}

extension HomeViewController: HomeDisplayLogic {
    
    func display(items: [Home.FetchItems.ViewModel]) {
        self.items = items
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.reuseId, for: indexPath)
        
        (cell as? HomeViewCell)?.viewModel = items[indexPath.row]

        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        switch item.title.lowercased() {
        case "missions":
            performSegue(withIdentifier: "Missions", sender: nil)
        case "launches":
            performSegue(withIdentifier: "Launches", sender: nil)
        default:
            performSegue(withIdentifier: "Rocket", sender: nil)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tableView.visibleCells.forEach { $0.isSelected = false }
        let location = scrollView.panGestureRecognizer.location(in: tableView)
        if let indexPath = tableView.indexPathForRow(at: location) {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.isSelected = true
        }
    }
}

