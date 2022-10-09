//
//  RemindersVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/4/22.
//

import UIKit


class RemindersVC: UIViewController {
    

    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var secondQuestionTitle: UILabel!
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpItems()
    }
    
    func setUpItems(){
        timePicker.backgroundColor = .systemGray6
        timePicker.layer.cornerRadius = 18
        timePicker.layer.masksToBounds = true
        
        saveButton.backgroundColor = .primaryIndigo
        saveButton.layer.cornerRadius = 32
        
        sundayButton.layer.cornerRadius = 21
        mondayButton.layer.cornerRadius = 21
        tuesdayButton.layer.cornerRadius = 21
        wednesdayButton.layer.cornerRadius = 21
        thursdayButton.layer.cornerRadius = 21
        fridayButton.layer.cornerRadius = 21
        saturdayButton.layer.cornerRadius = 21
        
        thursdayButton.layer.borderWidth = 0.2
        fridayButton.layer.borderWidth = 0.2
    }


}
