//
//  LoginVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/24/22.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var passwordBottomConsraint: NSLayoutConstraint!
    @IBOutlet weak var emailTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var gmailButton: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        editConstraint()
        // Do any additional setup after loading the view.
    }
    
    private func setUpUI(){
        emailTextfield.borderStyle = .none
        passwordTextfield.borderStyle = .none
        gmailButton.layer.borderWidth = 0.1
        gmailButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        gmailButton.layer.cornerRadius = 20
        emailTextfield.layer.cornerRadius = 20
        passwordTextfield.layer.cornerRadius = 20
        emailTextfield.setLeftPaddingPoints(20)
        passwordTextfield.setLeftPaddingPoints(20)
        loginButton.layer.cornerRadius = 20
        
    }
    
    private func editConstraint() {
        if screenHeight > 600 && screenHeight < 700 {
            emailTopConstraint.constant = 0
            passwordBottomConsraint.constant = 50
            print("cansu 700den buyuk")
            print(screenHeight)
        }
        if screenHeight > 700 && screenHeight < 900  {
            print(screenHeight)
            print("800den buyuk")
        }
        if screenHeight > 900 {
            emailTopConstraint.constant = 100
            passwordBottomConsraint.constant = 140
            print(screenHeight)
            print("900den buyuk")
        }
    }



}
