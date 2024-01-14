//
//  ChatScreenViewController.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/13/24.
//

import UIKit

class ChatScreenViewController: UIViewController {
    
    @IBOutlet var chatView: UITableView!
    
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
    }
    
}

extension ChatScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatScreenTableViewCell", for: indexPath) as! ChatScreenTableViewCell
        let chat = chatList[indexPath.row]
        cell.profileImage.image = UIImage(named: chat.user.profileImage)
        cell.userName.text = chat.user.rawValue
        cell.chatLabel.text = chat.message
        
        let stringFormatter = DateFormatter()
        stringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = stringFormatter.date(from: chat.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        let dateString = dateFormatter.string(from: date!)
        cell.chatDate.text = dateString
        
        tableView.separatorStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
