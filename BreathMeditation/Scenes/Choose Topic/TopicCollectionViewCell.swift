//
//  TopicCollectionViewCell.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/2/22.
//


import UIKit

class TopicCollectionViewCell: UICollectionViewCell {
    static let identifier = "TopicCollectionViewCell"
    
    var cellItem: Topic!
    
    var newHeight: CGFloat = {
        var newHeight: CGFloat = 100.0
        return newHeight
    }()
    
    private let newImage: UIImageView = {
        let newImage = UIImageView(frame: CGRect(x: 30, y: 0, width: 100, height: 100))
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.contentMode = .top
        return newImage
    }()
    
    private var title: UILabel = {
        var label = UILabel()
        label = UILabel(frame: CGRect(x: 10, y: 80, width: 160, height: 100))
        label.numberOfLines = 2
        label.textColor = .primaryWhite
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(newImage)
        contentView.clipsToBounds = true
        contentView.addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newImage.frame = contentView.bounds
        contentView.backgroundColor = cellItem.backgroundColor
        contentView.layer.cornerRadius = 12
        title.sizeToFit()
        title.center.y = newImage.center.y * 1.6// optionally if exists
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newImage.image = nil
    }
    
    func configure(image : UIImage?){
        newImage.image = image
    }
    
    func setupItems() {
        self.title.text = cellItem.topicTitle
        self.newImage.image = cellItem.topicImage
        self.newHeight = cellItem.topicHeight
    }
    
}
