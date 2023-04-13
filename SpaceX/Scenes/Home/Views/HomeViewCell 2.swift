//
//  HomeViewCell.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 07.04.2023.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    @IBOutlet weak var gradientView: UIView! {
        didSet {
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradient.locations = [0.0 , 0.9]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.frame = gradientView.bounds
            gradientView.layer.addSublayer(gradient)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        
    }
    
    private func configureLayout() {
        
    }
    
}
