//
//  Constants.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/7/22.
//

import Foundation
import UIKit

enum RecordType {
    static let  location = "PVLocations"
    static let profile = "PVProfile"
    
}

enum PlaceholderImage{
    static let avatar = UIImage(named: "user2")!
    static let square = UIImage(named: "user2")!
    static let banner = UIImage(named: "user2")!
    
}

enum  ImageDimension {
    case square, banner
  static  func getPlaceholder(for dimension: ImageDimension) -> UIImage {
        switch dimension {
        case .square:
            return PlaceholderImage.square
        case .banner:
            return PlaceholderImage.banner
        }
    }
}
