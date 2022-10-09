//
//  HomeCell.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/7/22.
//

import UIKit
import SnapKit


class HomeCell: UICollectionViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
 
    private let title: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let subtitle: UILabel = {
        let sublabel = UILabel()
        return sublabel
    }()
    
    private var bgcolor: UIColor = {
        let bgcolor = UIColor()
        return bgcolor
    }()
    
    private let time: UILabel = {
        let time = UILabel()
        return time
    }()
    
    

    func setupUI(with cell: Meditation) {
        self.image.backgroundColor = bgcolor
        image.layer.cornerRadius = 17
        contentView.addSubview(image)
        
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        title.textColor = .primaryTitleColor
        contentView.addSubview(title)
        
        subtitle.font = UIFont(name: "HelveticaNeue", size: 10.0)
        subtitle.textColor = .systemGray2
        contentView.addSubview(subtitle)
        
        time.font = UIFont(name: "HelveticaNeue", size: 10.0)
        time.textColor = .systemGray2
        contentView.addSubview(time)
        

    }
    
    var meditationItem: Meditation!
    {
        didSet {
            title.text = meditationItem.title
            image.image = meditationItem.imageName
            subtitle.text = meditationItem.subtitle
            bgcolor = meditationItem.color
            time.text = meditationItem.time
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.frame = CGRect(x: 0, y: contentView.frame.size.height - 50, width: contentView.frame.size.width - 10, height: 50)
        subtitle.frame = CGRect(x: 0, y: contentView.frame.size.height - 32, width: contentView.frame.size.width - 10, height: 50)
        image.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height-40)
        time.frame = CGRect(x: 63, y: contentView.frame.size.height - 32, width: contentView.frame.size.width - 10, height: 50)
    }
    
    
    
}
