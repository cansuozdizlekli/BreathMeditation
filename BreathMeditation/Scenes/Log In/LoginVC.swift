//
//  LoginVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/24/22.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LoginVC: UIViewController {

    @IBOutlet weak var passwordBottomConsraint: NSLayoutConstraint!
    @IBOutlet weak var emailTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var gmailButton: GIDSignInButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        editConstraint()
        
    }
    
    
    private func setUpUI(){
        emailTextfield.borderStyle = .none
        passwordTextfield.borderStyle = .none
        gmailButton.layer.borderWidth = 0.1
        gmailButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)
        gmailButton.layer.cornerRadius = 20
        emailTextfield.layer.cornerRadius = 20
        passwordTextfield.layer.cornerRadius = 20
        emailTextfield.setLeftPaddingPoints(20)
        passwordTextfield.setLeftPaddingPoints(20)
        loginButton.layer.cornerRadius = 20
        
    }
    
    private func setupGoogle(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
              print("Error \(error.localizedDescription)")
              return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)

        
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error{
                    print("Error \(error.localizedDescription)")
                    return
                }
            }
            print("Succesful sign in to our firebase")
            self.presentVC(to: TabBarController())
            
        }
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
    
    
    
    private func validateFeilds(){
        if emailTextfield.text?.isEmpty == true {
            print("no text in email textfield")
            return
        }
        if passwordTextfield.text?.isEmpty == true {
            print("no text in email textfield")
            return
        }
        login()
        
    }
    
    private func login(){
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { [weak self] authResult, err in
            guard self != nil else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }

    private func checkUserInfo(){
        if Auth.auth().currentUser != nil {
//            print(Auth.auth().currentUser?.uid)
            self.presentVC(to: TabBarController())

        }
    }

    @IBAction func loginTapped(_ sender: Any) {
        validateFeilds()
    }
    
    
    @IBAction func googleButtonTappped(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            setupGoogle()
        }
        
    }
    
}
