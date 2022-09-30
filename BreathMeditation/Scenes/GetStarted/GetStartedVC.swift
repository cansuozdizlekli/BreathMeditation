//
//  GetStartedVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/1/22.
//

import UIKit

class GetStartedVC: UIViewController {
    @IBOutlet weak var breathLabel: UILabel!
    @IBOutlet weak var meditationLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var secondWelcomeLabel: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        setUpTexts()
        view.backgroundColor = UIColor.primaryIndigo
        getStartedButton.backgroundColor = UIColor.secondaryWhite
        getStartedButton.layer.cornerRadius = 30
       
        
        
        
    }
    
    func setUpTexts(){
        breathLabel.addCharacterSpacing()
        breathLabel.textColor = UIColor.primaryWhite
        breathLabel.layer.opacity = 0.8
        
        meditationLabel.addCharacterSpacing()
        meditationLabel.textColor = UIColor.primaryWhite
        meditationLabel.layer.opacity = 0.8
        
        welcomeLabel.textColor = UIColor.secondaryWhite
        sloganLabel.textColor = .white
        sloganLabel.alpha = 0.9
        secondWelcomeLabel.textColor = UIColor.secondaryWhite
        sloganLabel.addDropShadow()
    }



}
