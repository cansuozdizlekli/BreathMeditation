//
//  UIView+Ext.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/7/22.
//

import UIKit


extension UIView {
    
    
    func addCornerRadius(_ radius: CGFloat = 10,
                         _ maskedCorners: CACornerMask) {
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
        layer.masksToBounds = false
    }
    
    
    func addDropShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.77
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
    }
    
}
