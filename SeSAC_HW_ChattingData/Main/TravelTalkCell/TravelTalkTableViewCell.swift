//
//  TravelTalkTableViewCell.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/13/24.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileName: UILabel!
    @IBOutlet var talkLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "TravelTalkTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
        
        profileName.font = UIFont.boldSystemFont(ofSize: 16)
        
        talkLabel.textColor = .gray
        talkLabel.font = UIFont.systemFont(ofSize: 14)
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = .gray
        
    }
}
