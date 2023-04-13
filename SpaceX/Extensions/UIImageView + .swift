//
//  UIImageView + .swift
//  SpaceX
//
//  Created by Yevhen Biiak on 10.04.2023.
//

import UIKit

extension UIImageView {
    
    func setImage(_ image: UIImage?) {
        image?.resize(to: self.frame.size) { image in
            image?.prepareForDisplay { [weak self] image in
                self?.image = image
            }
        }
    }
}
