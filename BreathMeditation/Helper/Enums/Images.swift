//
//  Images.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/7/22.
//

import Foundation
import UIKit

enum Images{
    case focus
    case happienes
    
    var image: UIImage {
        switch self {
        case .focus:
            return UIImage(named: "focus") ?? UIImage()
        case .happienes:
            return UIImage(named: "happieness") ?? UIImage()
        }
    }
}
