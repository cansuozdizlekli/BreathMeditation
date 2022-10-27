//
//  VoiceTableViewCell.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/9/22.
//

import UIKit
protocol VoiceTableViewCellDelegate : AnyObject{
    func playButtonTapped(soundItem: Sound)
}

class VoiceTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var cellItem: Sound! {
        didSet {
            voiceTitle.text = cellItem.name
            voiceTime.text = cellItem.time
        }
    }
    
    weak var delegate: VoiceTableViewCellDelegate?
    
    
    @IBOutlet weak var voiceStartButton: UIButton!
    @IBOutlet weak var voiceTime: UILabel!
    @IBOutlet weak var voiceTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        voiceStartButton.setImage(UIImage(systemName: "play.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 12)), for: UIControl.State.normal)
        voiceStartButton.setTitle("", for: UIControl.State.normal)
        voiceStartButton.backgroundColor = .primaryWhite
        voiceStartButton.tintColor = .systemGray2
        voiceStartButton.layer.borderWidth = 0.15
        voiceStartButton.layer.cornerRadius = 20
        voiceStartButton.addTarget(self, action: #selector(voiceStartButtonTapped(_:)), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @objc private func voiceStartButtonTapped(_ sender: UIButton) {
        delegate?.playButtonTapped(soundItem: cellItem)
    }
    
    
}
