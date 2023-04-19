//
//  LaunchImageCell.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import UIKit

class LaunchImageCell: UICollectionViewCell {
    
    static let reuseId = "LaunchImageCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var imageURL: URL? {
        didSet {
            activityIndicator.startAnimating()
            let imageRequest = ImageRequest(url: imageURL)
            imageRequest.execute { [weak self] image in
                self?.activityIndicator.stopAnimating()
                image?.prepare(for: self?.imageView) { imageView, image in
                    if imageRequest.url == self?.imageURL {
                        imageView?.image = image
                    }
                }
            }
        }
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
}
