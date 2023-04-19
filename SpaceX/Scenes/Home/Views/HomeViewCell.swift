//
//  HomeViewCell.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 07.04.2023.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    static let reuseId = "HomeViewCell"
    
    @IBOutlet weak var contentTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var myContentView: UIView! {
        didSet {
            myContentView.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    private lazy var gradient: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.7).cgColor,
            UIColor.black.withAlphaComponent(0.7).cgColor
        ]
        layer.locations = [0.0, 0.3, 1.0]
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 0.0, y: 1.0)
        layer.frame = myContentView.bounds.insetBy(dx: 0, dy: -40)
        
        return layer
    }()
    
    var viewModel: Home.FetchItems.ViewModel? {
        didSet {
            titleLabel.text = viewModel?.title.uppercased()
            descriptionLabel.text = viewModel?.description
            backgroundImageView?.setImage(viewModel?.image)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentTopConstraint.constant = selected ? 0 : 184

        UIView.animate(withDuration: 0.33) {
            self.layoutIfNeeded()
        }
    }
}
