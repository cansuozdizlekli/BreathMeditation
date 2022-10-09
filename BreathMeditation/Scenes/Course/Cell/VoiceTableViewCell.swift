//
//  VoiceTableViewCell.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/9/22.
//

import UIKit

class VoiceTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setUpUI(with cell : Voice){
           voiceTitle.text = cellItem.name
           voiceTime.text = cellItem.time
       }
       

       var cellItem: Voice!
       {
           didSet {
               voiceTitle.text = cellItem.name
               voiceTime.text = cellItem.time
           }
       }


    @IBOutlet weak var voiceStartButton: UIButton!
    @IBOutlet weak var voiceTime: UILabel!
    @IBOutlet weak var voiceTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
