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
    
    let chat = mockChatList
    var list: [ChatRoom] = mockChatList
    
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
        navigationController?.navigationBar.tintColor = .black
        
        searchBar.placeholder = "친구 이름을 검색해보세요"
        searchBar.delegate = self
                
        talkView.delegate = self
        talkView.dataSource = self
        
        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        talkView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    // 서치바에 검색했을 때, 검색 결과에 해당하는 사용자만 목록에 보여주기
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        
//        var filterChat: [ChatRoom] = []
//        
//        if searchBar.text == "" {
//            list = chat
//        } else {
//            for item in chat {
//                if item.chatList[0].user.rawValue.contains(searchBar.text!) {
//                    print("맞습니다")
//                    filterChat.append(item)
//                }
//            }
//            list = filterChat
//            print(list)
//            
//        }
//        if searchBar.text?.contains(mockChatList[0].chatList[0].user.rawValue) == true {
//            
//            print("맞습니다")
//        }
//    }
    
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
        // 최근 메세지로 보여주게 하기
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
