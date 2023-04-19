//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 05.04.2023.
//

import UIKit

@objc protocol HomeRoutingLogic: NSObjectProtocol {
    func routeToRocket(segue: UIStoryboardSegue?)
    func routeToLaunches(segue: UIStoryboardSegue?)
}

protocol HomeBusinessLogic {
    func fetchItems(request: Home.FetchItems.Request)
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var logoImageView: UIImageView!
    
    var interactor: HomeBusinessLogic?
    var router: HomeRoutingLogic?
    
    private var items: [Home.FetchItems.ViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        setupNavigationBar()
        
        HomeConfigurator.configure(with: self)
        
        fetchItems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    private func fetchItems() {
        let request = Home.FetchItems.Request()
        interactor?.fetchItems(request: request)
    }
    
    private func setBackgroundImage() {
//        let image = UIImage(named: "spacex_bg")?.blurred(radius: 15)
//        view.layer.contents = image?.cgImage
//        view.layer.contentsGravity = .resizeAspectFill
    }
    
    private func setupNavigationBar() {
        title = "∙∙∙spaceX∙∙∙"
        navigationItem.backButtonTitle = ""
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.titleTextAttributes = [.font: UIFont(name: "SpaceX", size: 22)!]
        navBarAppearance.largeTitleTextAttributes = [.font: UIFont(name: "SpaceX", size: 40)!]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
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
        if item.title.lowercased() == "launches" {
            performSegue(withIdentifier: "Launches", sender: nil)
        } else {
            performSegue(withIdentifier: "Rocket", sender: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // deselect all selected rows
        tableView.subviews.forEach {
            guard let cell = $0 as? UITableViewCell, cell.isSelected == true else { return }
            cell.isSelected = false
        }
        
        // get pan loaction
        let location = scrollView.panGestureRecognizer.location(in: tableView)
        
        // select row at location
        if let indexPath = tableView.indexPathForRow(at: location) {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.isSelected = true
        }
    }
}
