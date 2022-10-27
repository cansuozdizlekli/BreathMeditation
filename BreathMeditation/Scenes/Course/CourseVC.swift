//
//  CourseVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/8/22.
//

import UIKit


class CourseVC: UIViewController {
    
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
    private let favButton: UIButton = {
        let button = UIButton(frame: CGRect(x: screenWidth - 125, y: 45, width: 50, height: 50))
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, reqAlpha: 0.2)
        button.setImage(UIImage(systemName: "heart",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .primaryWhite
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.cornerRadius = 25
        return button
    }()
    private let shareButton: UIButton = {
        let button = UIButton(frame: CGRect(x: screenWidth - 65, y: 45, width: 50, height: 50))
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, reqAlpha: 0.2)
        button.setImage(UIImage(systemName: "square.and.arrow.up",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .primaryWhite
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.cornerRadius = 25
        return button
    }()
        
    var maleSounds = [Sound]()
    var femaleSounds = [Sound]()

    @IBOutlet weak var listeningLabel: UILabel!
    @IBOutlet weak var favLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sunImageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var sunHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    
    var course: CourseModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setupTableView()
        initCourse()
    }
    
    private func setupTableView() {
        tableView.register(VoiceTableViewCell.nib, forCellReuseIdentifier: VoiceTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    private func initUI(){
        self.navigationController?.navigationBar.isHidden = true
        segmentedControl.highlightSelectedSegment()
        sunHeightContraint.constant = screenHeight / 3
        sunImageView.addCornerRadius(15,  [.layerMinXMinYCorner,.layerMaxXMinYCorner])
        view.addSubview(backButton)
        view.addSubview(favButton)
        view.addSubview(shareButton)
        favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func initCourse() {
//        print("topic neymis ",UserDefaults.standard.object(forKey: "Topic"))
        pageTitleLabel.text = course.title
        typeLabel.text = "\(course.type)"
        descriptionLabel.text = course.description
        favLabel.text = String(course.favCount) + " Favourites"
        listeningLabel.text = String(course.listenCount) + " Listenings"
        for sound in course.sounds {
            if sound.isMale {
                for topic in sound.topics {
                    print(topic)
                    if topic == UserDefaults.standard.object(forKey: "Topic") as! String {
                        maleSounds.append(sound)
                    }
                }
            } else {
                for topic in sound.topics {
                    print(topic)
                    if topic == UserDefaults.standard.object(forKey: "Topic") as! String {
                        femaleSounds.append(sound)                    }
                }
            }
        }
    }
    
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        segmentedControl.underlinePosition()
        tableView.reloadData()
        
    }
    
    @objc private func backButtonTapped(_ sender: UIButton) {
        sender.bounceAnimate()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func favButtonTapped(_ sender: UIButton) {
        print("fav button tapped")
    }
    
    @objc private func shareButtonTapped(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: ["https://www.google.com.tr/"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true)
        print("share button tapped")
    }
    
}


extension CourseVC: UITableViewDelegate, UITableViewDataSource, VoiceTableViewCellDelegate {
    
    func playButtonTapped(soundItem: Sound) {
        let vc = VoiceVC()
//        vc.url = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3")!)
//        vc.selectedName = name
        vc.selectedSound = soundItem
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return maleSounds.count
        } else {
            return femaleSounds.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VoiceTableViewCell.identifier, for: indexPath) as? VoiceTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        
        if segmentedControl.selectedSegmentIndex == 0 {
            cell.cellItem = maleSounds[indexPath.row]
//            if course.sounds[indexPath.row].isMale {
//                cell.cellItem = course.sounds[indexPath.row]
//            }
        } else {
            cell.cellItem = femaleSounds[indexPath.row]
//            if !course.sounds[indexPath.row].isMale {
//                cell.cellItem = course.sounds[indexPath.row]
//            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: tableView.bounds.width / 2.5, y: 0)
        
        UIView.animate(
            withDuration: 0.9,
            delay: 0.005 * Double(indexPath.row),
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.1,
            options: [.curveEaseInOut, .allowUserInteraction],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
    }
}
