//
//  ChatScreenViewController.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/13/24.
//

import UIKit

class ChatScreenViewController: UIViewController, ReusableProtocol {
    
    @IBOutlet var chatView: UITableView!
    @IBOutlet var chatTextField: UITextField!
    
    var chatList: [Chat] = []
    var chatRoomName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureUI()
        
        
    }
}

extension ChatScreenViewController {
    func configureUI() {
        chatView.delegate = self
        chatView.dataSource = self
        
        let xib = UINib(nibName: ChatScreenTableViewCell.identifier, bundle: nil)
        chatView.register(xib, forCellReuseIdentifier: ChatScreenTableViewCell.identifier)
        
        let xib2 = UINib(nibName: UserChatTableViewCell.identifier, bundle: nil)
        chatView.register(xib2, forCellReuseIdentifier: UserChatTableViewCell.identifier)
        
        navigationItem.title = chatRoomName
        
        chatView.rowHeight = UITableView.automaticDimension
        
        chatTextField.placeholder = "메세지를 입력하세요"
        chatTextField.backgroundColor = .systemGray6
        chatTextField.delegate = self
        

    }
    
}

extension ChatScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        tableView.separatorStyle = .none
        let chat = chatList[indexPath.row]
        
        if chat.user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserChatTableViewCell.identifier, for: indexPath) as! UserChatTableViewCell
            
            cell.selectionStyle = .none

            cell.userChat.text = chat.message
            cell.userChat.numberOfLines = 0
            
            let stringFormatter = DateFormatter()
            stringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            let date = stringFormatter.date(from: chat.date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            let dateString = dateFormatter.string(from: date!)
            cell.dateLabel.text = dateString
            
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatScreenTableViewCell.identifier, for: indexPath) as! ChatScreenTableViewCell
            
            cell.selectionStyle = .none

            cell.profileImage.image = UIImage(named: chat.user.profileImage)
            cell.userName.text = chat.user.rawValue
            
            cell.chatLabel.text = chat.message
            cell.chatLabel.numberOfLines = 0
            
            let stringFormatter = DateFormatter()
            stringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            let date = stringFormatter.date(from: chat.date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            let dateString = dateFormatter.string(from: date!)
            cell.chatDate.text = dateString
            
            return cell
        }
        
        
    }
}

extension ChatScreenViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.chatTextField {
            UIView.animate(withDuration: 0.3) {
                let transform = CGAffineTransform(translationX: 0, y: -330)
                self.view.transform = transform
            }
        }
    }
}
