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
    
    let voiceArr :[Voice] = [Voice(name: "Body Scan", time: "5 MIN", isSelected: false),
                             Voice(name: "Focus Attention", time: "10 MIN", isSelected: true),
                             Voice(name: "Body Scan", time: "5 MIN", isSelected: false),
                             Voice(name: "Making Happieness", time: "3 MIN", isSelected: false),
                             Voice(name: "Focus Attention", time: "10 MIN", isSelected: true),
                             Voice(name: "Body Scan", time: "5 MIN", isSelected: false),
                             Voice(name: "Making Happieness", time: "3 MIN", isSelected: false),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CANSU  <<<< slf")
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
    }
    
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        segmentedControl.underlinePosition()
        
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
