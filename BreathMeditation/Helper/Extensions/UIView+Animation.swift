//
//  File.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/2/22.
//

import UIKit


extension UIView {
    
    
    func bounceAnimate() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = NSNumber(value: 1.0)
        animation.toValue = NSNumber(value: 0.8)
        animation.duration = 0.1
        animation.repeatCount = 1
        animation.autoreverses = true
        layer.add(animation, forKey: nil)
    }
    
    
}
