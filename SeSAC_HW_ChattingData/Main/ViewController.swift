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
    
    var chatRoomList: [ChatRoom] = mockChatList {
        didSet {
            talkView.reloadData()
        }
    }
    
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var searchedChat: [ChatRoom] = []
        
        if searchBar.text == "" {
            chatRoomList = mockChatList
        } else {
            for chatroom in chatRoomList {
                if chatroom.chatroomName.contains(searchBar.text!) {
                    searchedChat.append(chatroom)
                }
            }
            chatRoomList = searchedChat
            print(chatRoomList)

        }
//        var searchedUserChat: [ChatRoom] = []
//        
//        if searchBar.text == "" {
//            chatRoomList = mockChatList
//        } else {
//            
//            // chatroomlist에 있는 chatroom 꺼내오기
//            for chatroom in chatRoomList {
//                // ⭐️ searchedUserChat 쓴 곳에 안쓰고 여기 써야 하는 이유
//                var usersInChat: [String] = []
//
//                // chatroom 안에 있는 chat 꺼내오기
//                for chat in chatroom.chatList {
//                    // chat안에 있는 user 빈배열에 넣기
//                    usersInChat.append(chat.user.rawValue)
//                }
//                // 배열안에 넣은 유저 반복문 돌리기
//                for user in usersInChat {
//                    // 검색한 user가 user에 속해있다면
//                    if user.contains(searchBar.text!) {
//                        // 속한 채팅방을 새로운 배열안에 넣어주기
//                        searchedUserChat.append(chatroom)
//                        // ⭐️ break를 써야하는 이유
//                        break
//                        print(searchedUserChat)
//                    }
//                }
//
//            }
//            chatRoomList = searchedUserChat
//        }

    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // section의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatRoomList.count
        
    }
    
    // cell 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        cell.selectionStyle = .none
        cell.profileImage.image = UIImage(named: chatRoomList[indexPath.row].chatroomImage[0])
        cell.profileName.text = chatRoomList[indexPath.row].chatroomName
        // 최근 메세지로 보여주게 하기
        cell.talkLabel.text = chatRoomList[indexPath.row].chatList.last!.message
        cell.talkLabel.numberOfLines = 0
        
        let stringFormatter = DateFormatter()
        stringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = stringFormatter.date(from: chatRoomList[indexPath.row].chatList.last!.date)
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
        chatVC.chatRoomName = chatRoomList[indexPath.row].chatroomName
        chatVC.chatList = chatRoomList[indexPath.row].chatList
        
        navigationController?.pushViewController(chatVC, animated: true)
    }    
}
