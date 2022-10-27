//
//  FirstVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/24/22.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        editConstraint()
    }
    
    private func setUpUI(){
        signUpButton.layer.cornerRadius = 30
        signUpButton.layer.masksToBounds = true
        
    }
    
    private func editConstraint() {
        if screenHeight > 600 && screenHeight < 700 {
            buttonTopConstraint.constant = 30
            imageHeightConstraint.constant = 430
            print("cansu 700den buyuk")
            print(screenHeight)
        }
        if screenHeight > 700 && screenHeight < 900  {
            buttonTopConstraint.constant = 55
            imageHeightConstraint.constant = 500
            print(screenHeight)
            print("800den buyuk")
        }
        if screenHeight > 900 {
            buttonTopConstraint.constant = 60
            imageHeightConstraint.constant = 570
            print(screenHeight)
            print("900den buyuk")
        }
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        self.presentVC(to: LoginVC())
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        self.presentVC(to: SignUpVC())
    }
    
}
