//
//  UserChatTableViewCell.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/15/24.
//

import UIKit

class UserChatTableViewCell: UITableViewCell, ReusableProtocol {
    
    @IBOutlet var userChat: UILabel!
    @IBOutlet var chatBorder: UIView!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatBorder.layer.borderColor = UIColor.gray.cgColor
        chatBorder.layer.borderWidth = 1
        chatBorder.layer.cornerRadius = 8
        chatBorder.backgroundColor = .systemGray4
        
        userChat.font = UIFont.systemFont(ofSize: 14)
    }    
}
