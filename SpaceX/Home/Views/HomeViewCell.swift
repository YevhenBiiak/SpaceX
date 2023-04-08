//
//  HomeViewCell.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 07.04.2023.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    static let reuseId = "HomeViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var gradientView: UIView! {
        didSet {
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.colors = [
                UIColor.clear.cgColor,
                UIColor.black.withAlphaComponent(0.8).cgColor,
                UIColor.black.cgColor
            ]
            gradient.locations = [0.6, 0.85, 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.frame = gradientView.bounds
            gradientView.layer.addSublayer(gradient)
        }
    }
    
    var viewModel: Home.FetchItems.ViewModel? {
        didSet {
            titleLabel.text = viewModel?.title.uppercased()
            backgroundImageView.image = viewModel?.image
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        backgroundImageView.transform = highlighted
            ? CGAffineTransform(scaleX: 1.6, y: 1.6)
            : .identity
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        backgroundColor = .clear
    }
    
}
