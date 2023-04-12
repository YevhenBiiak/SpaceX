//
//  Date + .swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import Foundation

extension Date {
    
    func formatted(_ format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}
