//
//  UISegmentedControl+Ext.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/9/22.
//

import Foundation
import UIKit

extension UISegmentedControl{
    func removeBorder(){
        let background = UIImage.getSegRect(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(background, for: .normal, barMetrics: .default)
        self.setBackgroundImage(background, for: .selected, barMetrics: .default)
        self.setBackgroundImage(background, for: .highlighted, barMetrics: .default)
        
        let deviderLine = UIImage.getSegRect(color: UIColor.clear.cgColor, andSize: CGSize(width: 1.0, height: 5))
        self.setDividerImage(deviderLine, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.systemGray2], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.primaryIndigo], for: .selected)
    }
    
    // tab highlight when select
    
    func highlightSelectedSegment(){
        removeBorder()
        let lineWidth:CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let lineHeight:CGFloat = 1.0 //set height of underline height
        let lineXPosition = CGFloat(selectedSegmentIndex * Int(lineWidth))
        let lineYPosition = self.bounds.size.height - 6.0
        let underLineFrame = CGRect(x: lineXPosition, y: lineYPosition, width: lineWidth, height: lineHeight)
        let underLine = UIView(frame: underLineFrame)
        underLine.backgroundColor = UIColor.primaryIndigo
        underLine.tag = 1
        self.addSubview(underLine)
        
    }
    
    //set the position of bottom underline
    
    func underlinePosition(){
        guard let underLine = self.viewWithTag(1)else {return}
        let xPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        
        //spring animation when change tab
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8) {
            underLine.frame.origin.x = xPosition
        }
        
    }
}
