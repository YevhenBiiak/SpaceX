//
//  UIColor + .swift
//  SpaceX
//
//  Created by Yevhen Biiak on 06.04.2023.
//

import UIKit

extension UIImage {
    static func gradientImage(startColor: UIColor, endColor: UIColor, frame: CGRect) -> UIImage? {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        UIGraphicsBeginImageContext(frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        gradient.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
