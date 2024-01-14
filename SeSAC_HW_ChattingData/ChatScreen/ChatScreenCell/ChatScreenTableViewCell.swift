//
//  ChatScreenTableViewCell.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/13/24.
//

import UIKit

class ChatScreenTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatDate: UILabel!
    
    static let identifier = "ChatScreenTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
        
        chatLabel.layer.borderColor = UIColor.gray.cgColor
        chatLabel.layer.borderWidth = 1
        
    }
}
