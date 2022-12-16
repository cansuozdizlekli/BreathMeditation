//
//  GetStartedVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/14/22.
//

import UIKit
import FirebaseAuth
import Firebase

class GetStartedVC: UIViewController {
    
    var newUser : User!

    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var womanImageBottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        editConstraint()
        setUpUI()
        
        print("denemek cnm:",Auth.auth().currentUser?.displayName)

      

        
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        hiLabel.text = newUser.name
//    }
    
    private func editConstraint() {
        if screenHeight > 600 && screenHeight < 800 {
            womanImageBottomConstraint!.constant = -100
            print("cansu 700den buyuk")
        }
        if screenHeight > 800 && screenHeight < 900  {
            womanImageBottomConstraint!.constant = -20
            print(screenHeight)
            print("800den buyuk")
        }
        if screenHeight > 900 {
            womanImageBottomConstraint!.constant = 0
            print(screenHeight)
            print("900den buyuk")
        }

    }
    
    private func setUpUI(){
//        hiLabel.text = "Hi \(String(describing: newUser?.name))"
        getStartedButton.layer.cornerRadius = 30
        getStartedButton.layer.masksToBounds = true
        getStartedButton.backgroundColor = .secondaryWhite
    }


    @IBAction func getStartedButtonClicked(_ sender: Any) {
//        self.present(TabBarController(), animated: true)
        self.presentVC(to: ChooseTopicVC())
    }
    
}
