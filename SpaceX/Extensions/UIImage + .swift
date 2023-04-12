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
    
    func resize(to size: CGSize) -> UIImage? {
        
        let widthRatio = size.width / self.size.width
        let heightRatio = size.height / self.size.height
        
        // Calculate the scaling factor, keeping the proportions
        let scaleFactor = min(max(widthRatio, heightRatio), 1)
        
        // Calculate new image size
        let newSize = CGSize(width: self.size.width * scaleFactor, height: self.size.height * scaleFactor)
        
        // Create a graphic context with a new size
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        // Draw a modified image
        self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        
        // Get a new image from the graphic context
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Close the graphic context
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func resize(to size: CGSize, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
        
            let image = self.resize(to: size)
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
    func prepareForDisplay(_ completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            
            UIGraphicsBeginImageContext(self.size)
            let imageContext: CGContext! = UIGraphicsGetCurrentContext()
            imageContext.draw(self.cgImage!, in: CGRect(origin: .zero, size: self.size))
            UIGraphicsEndImageContext()
            
            DispatchQueue.main.async {
                completion(self)
            }
        }
    }
    
    func prepare(for imageView: UIImageView?, completion: @escaping (UIImageView?, UIImage?) -> Void) {
        guard let imageView else { return }
        self.resize(to: imageView.frame.size) { image in
            image?.prepareForDisplay { image in
                completion(imageView, image)
            }
        }
    }
}
