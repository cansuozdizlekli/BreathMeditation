//
//  SignUpVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/24/22.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var nameTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var gmailButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        editConstraint()
    }


    private func setUpUI(){
        emailTextfield.borderStyle = .none
        emailTextfield.clearsOnBeginEditing = true
        passwordTextfield.clearsOnBeginEditing = true
        nameTextfield.clearsOnBeginEditing = true
        passwordTextfield.borderStyle = .none
        nameTextfield.borderStyle = .none
        signUpButton.layer.borderWidth = 0.1
        signUpButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        signUpButton.layer.cornerRadius = 20
        gmailButton.layer.cornerRadius = 20
        gmailButton.layer.borderWidth = 0.1
        emailTextfield.layer.cornerRadius = 20
        passwordTextfield.layer.cornerRadius = 20
        nameTextfield.layer.cornerRadius = 20
        emailTextfield.setLeftPaddingPoints(20)
        passwordTextfield.setLeftPaddingPoints(20)
        nameTextfield.setLeftPaddingPoints(20)
        
    }
    
    private func editConstraint() {
        if screenHeight > 700 && screenHeight < 800 {
            print("kaçmış", nameTopConstraint.constant)
            nameTopConstraint.constant = 0
            print("cansu 700den buyuk")
            print(screenHeight)
        }
        if screenHeight > 800 && screenHeight < 900  {
            nameTopConstraint.constant = 44
            print(screenHeight)
            print("800den buyuk")
        }
        if screenHeight > 900 {
            
            print(screenHeight)
            print("900den buyuk")
        }
    }

}
