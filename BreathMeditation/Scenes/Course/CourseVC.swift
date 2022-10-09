//
//  CourseVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/8/22.
//

import UIKit

struct Voice{
    let name: String
    let time: String
    let isSelected: Bool
}

class CourseVC: UIViewController {
    
    var voiceArr :[Voice] = [
                             Voice(name: "Focus Attention", time: "10 MIN", isSelected: true),
                             Voice(name: "Body Scan", time: "5 MIN", isSelected: false),
                             Voice(name: "Making Happieness", time: "3 MIN", isSelected: false),
                             Voice(name: "Focus Attention", time: "10 MIN", isSelected: true),
                             Voice(name: "Body Scan", time: "5 MIN", isSelected: false),
                             Voice(name: "Making Happieness", time: "3 MIN", isSelected: false),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sunImageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var sunHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 45, width: 50, height: 50))
        button.backgroundColor = .primaryWhite
        button.setImage(UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .primaryTitleColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.cornerRadius = 25
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(VoiceTableViewCell.nib, forCellReuseIdentifier: VoiceTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        setUpItems()
        
    }
    
    func setUpItems(){
        self.navigationController?.navigationBar.isHidden = true
        segmentedControl.highlightSelectedSegment()
        sunHeightContraint.constant = screenHeight / 3
        sunImageView.addCornerRadius(15,  [.layerMinXMinYCorner,.layerMaxXMinYCorner])
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        tableView.showsVerticalScrollIndicator = false
    }
    
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        segmentedControl.underlinePosition()
        if sender.selectedSegmentIndex == 0 {
            voiceArr = [
                                     Voice(name: "Focus Attention", time: "10 MIN", isSelected: true),
                                     Voice(name: "Body Scan", time: "5 MIN", isSelected: false),
                                     Voice(name: "Making Happieness", time: "3 MIN", isSelected: false),
                                     Voice(name: "Focus Attention", time: "10 MIN", isSelected: true),
                                     Voice(name: "Body Scan", time: "5 MIN", isSelected: false),
                                     Voice(name: "Making Happieness", time: "3 MIN", isSelected: false),
            ]
            tableView.reloadData()
        }
        if sender.selectedSegmentIndex == 1 {
            voiceArr = [
                                     Voice(name: "Female Sound 1", time: "10 MIN", isSelected: true),
                                     Voice(name: "Female Sound 2", time: "5 MIN", isSelected: false),
                                     Voice(name: "Female Sound 3", time: "3 MIN", isSelected: false),
                                     Voice(name: "Female Sound 4", time: "10 MIN", isSelected: true)
            ]
            tableView.reloadData()
        }
        
    }
    
    @objc private func backButtonTapped(_ sender: UIButton) {
        sender.bounceAnimate()
        self.navigationController?.popToRootViewController(animated: true)
    }
}




extension CourseVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voiceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VoiceTableViewCell.identifier, for: indexPath) as? VoiceTableViewCell else {
            fatalError()
        }
        
        cell.cellItem = voiceArr[indexPath.row]
        cell.setUpUI(with: voiceArr[indexPath.row])
        return cell
    }
}
