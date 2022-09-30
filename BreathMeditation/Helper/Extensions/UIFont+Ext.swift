//
//  UIFont+Ext.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 9/30/22.
//


import UIKit

extension UIFont {
    
    static func customFont(name: CustomFont, size: CGFloat) -> UIFont {
        let font = UIFont(name: name.rawValue, size: size)
        return font ?? UIFont.systemFont(ofSize: size)
    }
}


enum CustomFont: String {
    case customCansu = "Tungsten-Semibold"
    case airbnbCereal_W_XBd = "AirbnbCereal_W_XBd"
    case airbnbCereal_W_Bd = "AirbnbCereal_W_Bd"
    case airbnbCereal_W_Blk = "AirbnbCereal_W_Blk"
    case airbnbCereal_W_Lt = "AirbnbCereal_W_Lt"
    case airbnbCereal_W_Md = "AirbnbCereal_W_Md"
}
