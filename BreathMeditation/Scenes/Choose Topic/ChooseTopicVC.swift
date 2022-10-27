//
//  ChooseTopicVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/2/22.
//

struct Topic {
    var topicImage: UIImage
    let topicTitle: String
    let topicHeight: CGFloat
    var backgroundColor: UIColor
}

var topics : [Topic] = [
    Topic(topicImage: UIImage(named: "reduce-stress")!, topicTitle: "Reduce Stress",topicHeight: UIImage(named: "reduce-stress")!.size.height, backgroundColor: UIColor.init(red: 140, green: 151, blue: 255)),
    Topic(topicImage: UIImage(named: "improve-performance")!, topicTitle: "Improve Performance",topicHeight: UIImage(named: "improve-performance")!.size.height, backgroundColor: UIColor.init(red: 255, green: 98, blue: 81)),
    Topic(topicImage: UIImage(named: "increase-happiness")!, topicTitle: "Increase Happiness",topicHeight: UIImage(named: "increase-happiness")!.size.height, backgroundColor: UIColor.init(red: 255, green: 173, blue: 136)),
    Topic(topicImage: UIImage(named: "reduce-anxiety")!, topicTitle: "Reduce Anxiety",topicHeight: UIImage(named: "reduce-anxiety")!.size.height, backgroundColor: UIColor.init(red: 255, green: 205, blue: 122)),
    Topic(topicImage: UIImage(named: "personal-growth")!, topicTitle: "Personal Growth",topicHeight: UIImage(named: "personal-growth")!.size.height, backgroundColor: UIColor.init(red: 81, green: 181, blue: 139)),
    Topic(topicImage: UIImage(named: "better-sleep")!, topicTitle: "Better Sleep",topicHeight: UIImage(named: "better-sleep")!.size.height, backgroundColor: UIColor.init(red: 64, green: 65, blue: 79)),
    Topic(topicImage: UIImage(named: "reduce-stress")!, topicTitle: "Reduce Stress",topicHeight: UIImage(named: "reduce-stress")!.size.height, backgroundColor: UIColor.init(red: 140, green: 151, blue: 255)),
    Topic(topicImage: UIImage(named: "feeling-calm")!, topicTitle: "Feeling Calm",topicHeight: UIImage(named: "feeling-calm")!.size.height, backgroundColor: UIColor.init(red: 227, green: 162, blue: 181)),
    Topic(topicImage: UIImage(named: "reduce-stress")!, topicTitle: "Reduce Stress",topicHeight: UIImage(named: "reduce-stress")!.size.height, backgroundColor: UIColor.init(red: 140, green: 151, blue: 255)),
    Topic(topicImage: UIImage(named: "improve-performance")!, topicTitle: "Improve Performance",topicHeight: UIImage(named: "improve-performance")!.size.height, backgroundColor: UIColor.init(red: 255, green: 98, blue: 81)),
    Topic(topicImage: UIImage(named: "increase-happiness")!, topicTitle: "Increase Happiness",topicHeight: UIImage(named: "increase-happiness")!.size.height, backgroundColor: UIColor.init(red: 255, green: 173, blue: 136)),
    Topic(topicImage: UIImage(named: "reduce-anxiety")!, topicTitle: "Reduce Anxiety",topicHeight: UIImage(named: "reduce-anxiety")!.size.height, backgroundColor: UIColor.init(red: 255, green: 205, blue: 122)),
    Topic(topicImage: UIImage(named: "personal-growth")!, topicTitle: "Personal Growth",topicHeight: UIImage(named: "personal-growth")!.size.height, backgroundColor: UIColor.init(red: 81, green: 181, blue: 139)),
    Topic(topicImage: UIImage(named: "better-sleep")!, topicTitle: "Better Sleep",topicHeight: UIImage(named: "better-sleep")!.size.height, backgroundColor: UIColor.init(red: 64, green: 65, blue: 79)),
    Topic(topicImage: UIImage(named: "reduce-stress")!, topicTitle: "Reduce Stress",topicHeight: UIImage(named: "reduce-stress")!.size.height, backgroundColor: UIColor.init(red: 140, green: 151, blue: 255)),
    Topic(topicImage: UIImage(named: "feeling-calm")!, topicTitle: "Feeling Calm",topicHeight: UIImage(named: "feeling-calm")!.size.height, backgroundColor: UIColor.init(red: 227, green: 162, blue: 181))

    

    
]

import UIKit
import CHTCollectionViewWaterfallLayout

class ChooseTopicVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , CHTCollectionViewDelegateWaterfallLayout{
    
    let collectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        layout.minimumColumnSpacing = 15
        layout.minimumInteritemSpacing = 15
        
        let collectionView = UICollectionView(frame:
                                            CGRect(x: 15, y: 100 ,
                                                   width: screenWidth - 45,
                                                   height: screenHeight),
                                                   collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(TopicCollectionViewCell.self,                                                          forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let nextPageButton: UIButton = {
        let button = UIButton(frame: CGRect(x: screenWidth - 80, y: 95, width: 50, height: 50))
        button.backgroundColor = .primaryWhite
        button.setImage(UIImage(systemName: "arrow.forward",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .primaryTitleColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.2
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.center.x = self.view.center.x
        collectionView.center.y = self.view.center.y
        view.addSubview(collectionView)
        
        nextPageButton.addTarget(self, action: #selector(nextPageButtonTapped), for: .touchUpInside)
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as? TopicCollectionViewCell else{
            fatalError()
        }
        cell.configure(image: topics[indexPath.row].topicImage)
        cell.layer.cornerRadius = 12
        let title = UILabel()
        title.text = topics[indexPath.row].topicTitle
        cell.cellItem = topics[indexPath.row]
        cell.setupItems()
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 20, y: screenHeight * 0.26, width: screenWidth - 40, height: screenHeight - 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width , height: topics[indexPath.row].topicHeight * 3.7)
    }
    
    @objc func nextPageButtonTapped(){
        let vc = RemindersVC()
        vc.modalPresentationStyle = .fullScreen
        self.presentVC(to: vc)
    }
    
    
    var bookmark = UIImageView(image: UIImage(systemName: "bookmark.fill"))
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(topics[indexPath.row].topicTitle)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? TopicCollectionViewCell {
            bookmark.tintColor = .white
            bookmark.tintColor = .white
            bookmark.frame = CGRect(x: cell.frame.width - 30, y: cell.frame.height - 30, width: 20, height: 20)
            if cell.isSelected {
                cell.addSubview(bookmark)
                view.addSubview(nextPageButton)
                cell.bounds = CGRect(x: 0, y: 0, width: cell.frame.width * 1.01, height: cell.frame.height * 1.01)
                cell.isUserInteractionEnabled = false
                UserDefaults.standard.set(cell.cellItem.topicTitle, forKey: "Topic")
                print(cell.cellItem.topicTitle)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TopicCollectionViewCell {
            print(cell.cellItem.topicTitle ,"deselect")
            cell.isUserInteractionEnabled = true
            cell.bounds = CGRect(x: 0, y: 0, width: cell.frame.width * 0.99, height: cell.frame.height * 0.99)
        }
    }

    
    

}
