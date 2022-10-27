//
//  HomeVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/6/22.
//

import UIKit

struct Meditation{
    let title: String
    let subtitle: String
    let imageName: UIImage
    let time : String
    let color : UIColor
}

var data :[Meditation] = [
    Meditation(title: "Focus", subtitle: "MEDITATION", imageName: Images.focus.image, time: "● 3-10 MIN",color: UIColor.focusBackground),
    Meditation(title: "Happieness", subtitle: "MEDITATION", imageName: Images.happienes.image, time: "● 3-10 MIN",color: UIColor.white),
    Meditation(title: "Focus", subtitle: "MEDITATION", imageName: Images.focus.image, time: "● 3-10 MIN",color: UIColor.focusBackground),
    Meditation(title: "Happieness", subtitle: "MEDITATION", imageName: Images.happienes.image, time: "●  3-10 MIN",color: UIColor.white)
]

class HomeVC: UIViewController {

    @IBOutlet weak var dailyThoughtLabel: UILabel!
    @IBOutlet weak var weWishBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var dailyView: UIView!
    @IBOutlet weak var dailyImage: UIImageView!
    @IBOutlet weak var relaxationMusicImage: UIImageView!
    @IBOutlet weak var basicCourseImage: UIImageView!
    @IBOutlet weak var weWishLabel: UILabel!
    @IBOutlet weak var goodMorningLabel: UILabel!
    @IBOutlet weak var recomendedLabel: UILabel!
    @IBOutlet weak var recommendsCollectionView: UICollectionView!
    @IBOutlet weak var headerTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var recomendedTitleTopConstraint: NSLayoutConstraint!
    
    let courses: [CourseModel] = [
        CourseModel(title: "Happy Morning", type: .BASIC, description: "Ease the mind into a restful night’s sleep  with these deep, amblent tones.", favCount: 28903, listenCount: 34948,
                sounds: [
                    Sound(name: "Focus Attention", time: "10 MIN", isMale: false, topics: ["Reduce Stress","Improve Performance","Increase Happiness"]),
                    Sound(name: "Body Scan", time: "5 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep"]),
                    Sound(name: "The Breath", time: "3 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                    Sound(name: "Emotional Triggers", time: "7 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep","Feeling Calm"]),
                    Sound(name: "Compassion", time: "7 MIN", isMale: true, topics: ["Reduce Anxiety","Personal Growth","Better Sleep","Feeling Calm"]),
                    Sound(name: "Forgiveness", time: "10 MIN", isMale: false, topics: ["Reduce Stress","Improve Performance","Increase Happiness"]),
                    Sound(name: "Inspiration", time: "5 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Increase Happiness","Personal Growth","Better Sleep","Feeling Calm"]),
                    Sound(name: "A Conversation", time: "20 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                    Sound(name: "Healing", time: "3 MIN", isMale: false, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                    Sound(name: "Relax", time: "5 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep"]),
                    Sound(name: "The Breath", time: "3 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                    Sound(name: "Yoga Meditation", time: "7 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep","Feeling Calm"]),
                    Sound(name: "Open Your Heart", time: "10 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Increase Happiness"]),
                    
                ]),
        CourseModel(title: "Relaxation", type: .MUSIC, description: "Music is effective for relaxation and stress management.", favCount: 16938, listenCount: 97334,
                sounds: [
                    Sound(name: "Focus Attention", time: "10 MIN", isMale: false, topics: ["Reduce Stress","Improve Performance","Increase Happiness"]),
                    Sound(name: "Body Scan", time: "5 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep"]),
                    Sound(name: "The Present Moment", time: "3 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                    Sound(name: "The Breath", time: "3 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                    Sound(name: "Emotional Triggers", time: "7 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep","Feeling Calm"]),
                    Sound(name: "Compassion", time: "7 MIN", isMale: true, topics: ["Reduce Anxiety","Personal Growth","Better Sleep","Feeling Calm"]),
                    Sound(name: "Forgiveness", time: "10 MIN", isMale: false, topics: ["Reduce Stress","Improve Performance","Increase Happiness"]),
                    Sound(name: "Inspiration", time: "5 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Increase Happiness","Personal Growth","Better Sleep","Feeling Calm"]),
        ]),
        CourseModel(title: "Daily Thought", type: .MEDITATION, description: "The best way to make your dreams come true is to wake up.", favCount: 2333, listenCount: 12345,
                    sounds: [
                        Sound(name: "Focus Attention", time: "10 MIN", isMale: false, topics: ["Reduce Stress","Improve Performance","Increase Happiness"]),
                        Sound(name: "Body Scan", time: "5 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep"]),
                        Sound(name: "Emotions", time: "3 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                        Sound(name: "The Breath", time: "3 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                        Sound(name: "A Conversation", time: "20 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                        Sound(name: "Healing", time: "3 MIN", isMale: false, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                        Sound(name: "Relax", time: "5 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep"]),
                        Sound(name: "The Breath", time: "3 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Feeling Calm"]),
                        Sound(name: "Yoga Meditation", time: "7 MIN", isMale: false, topics: ["Reduce Anxiety","Personal Growth","Better Sleep","Feeling Calm"]),
                        Sound(name: "Open Your Heart", time: "10 MIN", isMale: true, topics: ["Reduce Stress","Improve Performance","Increase Happiness"]),
                            ])
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicCourseImage.layer.cornerRadius = 12
        relaxationMusicImage.layer.cornerRadius = 12
        dailyImage.layer.cornerRadius = 12
        dailyView.layer.cornerRadius = 12
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        recommendsCollectionView.delegate = self
        recommendsCollectionView.dataSource = self
        recommendsCollectionView.showsHorizontalScrollIndicator = false
        recommendsCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: view.frame.size.width/3, height: view.frame.size.height/6.5)
        recommendsCollectionView.collectionViewLayout = layout
    }

    func editSize () {
        if screenHeight > 600 && screenHeight < 800 {
            headerTopConstraint.constant = 15
            recomendedTitleTopConstraint.constant = 15
            weWishBottomConstraint.constant = 5
            print("cansu 700den buyuk")
        }
        if screenHeight > 800 && screenHeight < 900  {
            headerTopConstraint.constant = 35
            recomendedTitleTopConstraint.constant = 35
            weWishBottomConstraint.constant = 25
            print(screenHeight)
            print("800den buyuk")
        }
        if screenHeight > 900 {
            headerTopConstraint.constant = 40
            recomendedTitleTopConstraint.constant = 40
            weWishBottomConstraint.constant = 30
            goodMorningLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 23.0)
            weWishLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
            recomendedLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 23.0)
            print(screenHeight)
            print("900den buyuk")
        }

    }

    @IBAction func basicCourseStartButtonTapped(_ sender: UIButton) {
        let vc = CourseVC()
        vc.course = courses[sender.tag]
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dailyThoughtStartButtonTapped(_ sender: UIButton) {
        let vc = CourseVC()
        vc.course = courses[sender.tag]
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func relaxationButtonTapped(_ sender: UIButton) {
        let vc = CourseVC()
        vc.course = courses[sender.tag]
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}



extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
            fatalError()
        }
        cell.meditationItem = data[indexPath.row]
        cell.setupUI(with: data[indexPath.row])
        return cell
    }
    
}
