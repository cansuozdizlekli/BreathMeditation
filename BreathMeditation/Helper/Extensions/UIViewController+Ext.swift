//
//  UIViewController+Ext.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/2/22.
//

import UIKit


extension UIViewController {
    
    func presentVC(to vc: UIViewController, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle: UIModalPresentationStyle = .fullScreen) {
        vc.modalPresentationStyle = presentationStyle
        vc.modalTransitionStyle = transitionStyle
        self.present(vc, animated: true)
    }
}
