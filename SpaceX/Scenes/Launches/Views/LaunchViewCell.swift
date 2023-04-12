//
//  LaunchViewCell.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import UIKit

class LaunchViewCell: UICollectionViewCell {
    
    static let reuseId = "LaunchViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: Launches.FetchLaunches.ViewModel? {
        didSet {
            titleLabel.text = viewModel?.title.uppercased()
            dateLabel.text = viewModel?.date.uppercased()
            
            if let image = ImageCache.shared.get(for: viewModel?.imageURL) {
                imageView.setImage(image)
            } else {
                let imageRequest = ImageRequest(url: viewModel?.imageURL)
                imageRequest.execute { [weak self] image in
                    image?.prepare(for: self?.imageView) { imageView, image in
                        ImageCache.shared.set(image, for: imageRequest.url)
                        if imageRequest.url == self?.viewModel?.imageURL {
                            imageView?.image = image
                        }
                    }
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    private func setupCell() {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.3)
        selectedBackgroundView = view
    }
}
