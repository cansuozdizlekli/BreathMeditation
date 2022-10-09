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
    let backgroundColor: UIColor
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
        layout.headerHeight = 100
        if screenHeight > 700 {
            layout.sectionInset = UIEdgeInsets(top: 55, left: 0, bottom: 0, right: 0);
        } else {
            layout.sectionInset = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0);
        }

        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0 , width: screenWidth - 45, height: screenHeight), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.center.x = self.view.center.x
        collectionView.center.y = self.view.center.y
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
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.size.width , height: topics[indexPath.row].topicHeight * 3.7)
    }



}
