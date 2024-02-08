//
//  TravelTalkTableViewCell.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/13/24.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell, ReusableProtocol {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileName: UILabel!
    @IBOutlet var talkLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.gray.cgColor
        profileImage.layer.borderWidth = 1
        
        profileName.font = UIFont.boldSystemFont(ofSize: 16)
        
        talkLabel.textColor = .gray
        talkLabel.font = UIFont.systemFont(ofSize: 14)
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = .gray
    }
}
