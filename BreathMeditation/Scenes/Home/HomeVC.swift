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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if screenHeight > 700 && screenHeight < 800 {
            headerTopConstraint.constant = 30
            recomendedTitleTopConstraint.constant = 30
            weWishBottomConstraint.constant = 20
            print(screenHeight)
            print("700den buyuk")
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
    
    
    @IBAction func basicCourseStartButtonTapped(_ sender: Any) {
        
        self.navigationController?.pushViewController(CourseVC(), animated: true)
//        self.presentVC(to: CourseVC())
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
