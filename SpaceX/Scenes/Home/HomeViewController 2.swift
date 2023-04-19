//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 05.04.2023.
//

import UIKit

protocol HomeRoutingLogic: NSObjectProtocol {
    
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
            imageView.widthAnchor.constraint(equalTo: navigationBar.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1 / logo.aspectRation),
            imageView.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor, constant: navigationBar.frame.width * 0.055),
            imageView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath)

        cell.backgroundColor = .clear

        return cell
    }


}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

