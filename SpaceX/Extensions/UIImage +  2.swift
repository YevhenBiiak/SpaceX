//
//  UIImage + .swift
//  SpaceX
//
//  Created by Yevhen Biiak on 06.04.2023.
//

import UIKit

extension UIImage {
    
    func blurred(radius: CGFloat) -> UIImage? {
        
        let context = CIContext(options: nil)
        let inputImage = CIImage(image: self)
        
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(radius, forKey: kCIInputRadiusKey)
        
        guard let outputImage = filter?.outputImage,
              let cgImage = context.createCGImage(outputImage, from: inputImage?.extent ?? .zero)
        else { return nil }
        
        return UIImage(cgImage: cgImage)
    }
    
    var aspectRation: CGFloat {
        size.width / size.height
    }
}
