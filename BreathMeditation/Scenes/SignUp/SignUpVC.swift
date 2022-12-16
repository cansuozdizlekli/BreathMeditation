//
//  SignUpVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/24/22.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class SignUpVC: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var nameTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var gmailButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    let button = UIButton(type: .custom)
    var btnColor = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        editConstraint()

        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }


    private func setUpUI(){
        nameTextfield.delegate = self
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        emailTextfield.borderStyle = .none
        passwordTextfield.borderStyle = .none
        nameTextfield.borderStyle = .none
        passwordTextfield.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.textfeildText]
            
        )
        passwordTextfield.textColor = .textfeildText
        emailTextfield.attributedPlaceholder = NSAttributedString(
            string: "Email Address",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.textfeildText]
            
        )
        emailTextfield.textColor = .textfeildText

        nameTextfield.attributedPlaceholder = NSAttributedString(
            string: "Name and Surname",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.textfeildText]
            
        )
        nameTextfield.textColor = .textfeildText
        signUpButton.layer.borderWidth = 0.1
        signUpButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        signUpButton.layer.cornerRadius = 20
        gmailButton.layer.cornerRadius = 20
        gmailButton.layer.borderWidth = 0.1
        gmailButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)
        emailTextfield.layer.cornerRadius = 20
        passwordTextfield.layer.cornerRadius = 20
        nameTextfield.layer.cornerRadius = 20
        emailTextfield.setLeftPaddingPoints(20)
        passwordTextfield.setLeftPaddingPoints(20)
        nameTextfield.setLeftPaddingPoints(20)
        button.setImage(UIImage(systemName: "eye"), for: UIControl.State.normal)
        button.frame = CGRect(x: passwordTextfield.bounds.width - 50, y: (passwordTextfield.bounds.height - 30) / 2, width: 30, height: 30)

        button.tintColor = .systemGray2
        button.addTarget(self, action: #selector(changePasswordButtonImage(sender:)), for: UIControl.Event.touchUpInside)
        passwordTextfield.addSubview(button)
        textFieldDidBeginEditing(nameTextfield, text: "Name and Surname")
        textFieldDidBeginEditing(passwordTextfield, text: "Password")
        textFieldDidBeginEditing(emailTextfield, text: "Email Address")

        
    }
    
    private func editConstraint() {
        if screenHeight > 700 && screenHeight < 800 {
            print("kaçmış", nameTopConstraint.constant)
            nameTopConstraint.constant = 0
            print("cansu 700den buyuk")
            print(screenHeight)
        }
        if screenHeight > 800 && screenHeight < 900  {
            print(screenHeight)
            print("800den buyuk")
        }
        if screenHeight > 900 {
            
            print(screenHeight)
            print("900den buyuk")
        }
    }
    
    @objc func changePasswordButtonImage(sender: UIButton){
        
            sender.isSelected.toggle()
            if sender.isSelected {
                sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                passwordTextfield.isSecureTextEntry = true
            } else {
                sender.setImage(UIImage(systemName: "eye"), for: .normal)
                passwordTextfield.isSecureTextEntry = false
        }
    }
    
    @objc func hideKeyboard(){
        nameTextfield.resignFirstResponder()
        emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField, text:String) {
        textField.text = textField.text
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        if emailTextfield.text?.isEmpty == true {
            print("no text in email textfield")
            return
        }
        
        if passwordTextfield.text?.isEmpty == true {
            print("no text in email textfield")
            return
        }
        
        signUp()
        
    }
    
    
    
    func signUp(){
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authResult, error in
            guard let user = authResult?.user, error == nil else{
                print("Error 1 \(String(describing: error?.localizedDescription))")
                return
            }
        }
        if Auth.auth().currentUser != nil {
            print("cansu1 yeni sayfa acılıs")
            let vc = GetStartedVC()
            vc.newUser.name = nameTextfield.text!
            self.presentVC(to: GetStartedVC())
        }
        
    }
   
    private func setupGoogle(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
              print("Error 2 \(error.localizedDescription)")
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
                    print("Error 3 \(error.localizedDescription)")
                    return
                }
            }
//            if Auth.auth().currentUser != nil {
//                print("Succesful sign in with google to our firebase", user?.profile?.name as Any, user?.profile?.familyName as Any, user?.profile?.givenName as Any)
//                self.presentVC(to: GetStartedVC())
//            }
            self.presentVC(to: GetStartedVC())
            
            
           
            print("Succesful sign in with google to our firebase", user?.profile?.name as Any, user?.profile?.familyName as Any, user?.profile?.givenName as Any)
        }
    }
    
    @IBAction func googleButtonTappped(_ sender: Any) {
        print("google button tapped")
        if Auth.auth().currentUser == nil {
            print("current user yok suan set up google calıscak")
            setupGoogle()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let user = Auth.auth().currentUser
        print("kullanıcı",user?.displayName as Any)
    }

    
    
}
