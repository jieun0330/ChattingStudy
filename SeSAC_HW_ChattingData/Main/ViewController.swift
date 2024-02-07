//
//  ViewController.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/13/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var talkView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
}

extension ViewController {
    
    func configureUI() {
        
        navigationItem.title = "TRAVEL TALK"
        navigationItem.backButtonTitle = ""
        navigationController?.hidesBarsOnSwipe = true
        
        searchBar.placeholder = "친구 이름을 검색해보세요"
        
        talkView.delegate = self
        talkView.dataSource = self
        
        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        talkView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // section의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList.count
        
    }
    
    // cell 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        cell.selectionStyle = .none
        cell.profileImage.image = UIImage(named: mockChatList[indexPath.row].chatroomImage[0])
        cell.profileName.text = mockChatList[indexPath.row].chatroomName
        cell.talkLabel.text = mockChatList[indexPath.row].chatList.last!.message
        cell.talkLabel.numberOfLines = 0
        
        let stringFormatter = DateFormatter()
        stringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = stringFormatter.date(from: mockChatList[indexPath.row].chatList.last!.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        let dateString = dateFormatter.string(from: date!)
        cell.dateLabel.text = dateString
        
        tableView.separatorStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatSB = UIStoryboard(name: "Main", bundle: nil)
        let chatVC = chatSB.instantiateViewController(identifier: ChatScreenViewController.identifier) as! ChatScreenViewController
        chatVC.chatRoomName = mockChatList[indexPath.row].chatroomName
        chatVC.chatList = mockChatList[indexPath.row].chatList
        
        navigationController?.pushViewController(chatVC, animated: true)
    }

    
}
