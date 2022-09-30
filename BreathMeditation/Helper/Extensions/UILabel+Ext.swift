//
//  UILabel+Ext.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/1/22.
//

import UIKit

extension UILabel {
  func addCharacterSpacing(kernValue: Double = 1.35) {
    guard let text = text, !text.isEmpty else { return }
    let string = NSMutableAttributedString(string: text)
    string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
    attributedText = string
  }
    func addDropShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.77
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
    }
   

}


