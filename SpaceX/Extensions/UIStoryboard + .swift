//
//  UIStoryboard + .swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

extension UIStoryboard {
    
    static let main = UIStoryboard(name: "Main", bundle: nil)
    
    func instance<T: UIViewController>(of viewController: T.Type) -> T {
        let identifier = String(describing: viewController.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}
