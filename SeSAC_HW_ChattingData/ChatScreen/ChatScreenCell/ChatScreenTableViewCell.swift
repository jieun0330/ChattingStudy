//
//  ChatScreenTableViewCell.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/13/24.
//

import UIKit

class ChatScreenTableViewCell: UITableViewCell, ReusableProtocol {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatBorder: UILabel!
    @IBOutlet var chatDate: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.gray.cgColor
        profileImage.layer.borderWidth = 0.3
        
        chatBorder.layer.borderColor = UIColor.gray.cgColor
        chatBorder.layer.borderWidth = 1
        chatBorder.layer.cornerRadius = 8
        
        chatLabel.font = UIFont.systemFont(ofSize: 14)        
    }
}
