//
//  ChatViewController.swift
//  hardCoded
//
//  Created by Finn Kiesinger on 23.02.19.
//  Copyright © 2019 devCore. All rights reserved.
//

import UIKit

struct Chat {
    var members: [String]
    var latestMessage: String
    var key: String
}

extension UIImage {
    func resizeImage(newSize: CGSize) -> UIImage {
        if newSize == self.size {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
class ChatViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    var chatArray = [
        Chat(members: ["fkiesinger", "kkiesinger"], latestMessage: "I'm Jeff", key: "key"),
        Chat(members: ["finnkiesinger", "kaikiesinger"], latestMessage: "I'm the ultimate Jeff, hahahahahahahahahahahahahahahahahahahahahahahahahahahaha", key: "secKey")
    ]
    var id = "chatCell"
    
    func setupView() {
        let edit = UIImage(named: "edit")?.resizeImage(newSize: CGSize(width: 30, height: 30))
        let rightNavButton = UIBarButtonItem(image: edit, style: UIBarButtonItem.Style.plain, target: self, action: #selector(callNewChatViewController))
        rightNavButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationItem.rightBarButtonItem = rightNavButton
        navigationItem.title = "Chats"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1843137255, green: 0.4509803922, blue: 0.8784313725, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 40) ?? UIFont.systemFont(ofSize: 35),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 22)!,
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        
        tableView.register(ChatCell.self, forCellReuseIdentifier: id)
    }
    
    @objc func callNewChatViewController() {
        let newChatViewController = NewChatViewController()
        present(newChatViewController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as! ChatCell
        cell.chat = chatArray[indexPath.row]
        return cell
    }
    
}
