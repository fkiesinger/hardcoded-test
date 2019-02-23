//
//  ViewController.swift
//  hardCoded
//
//  Created by Finn Kiesinger on 23.02.19.
//  Copyright © 2019 devCore. All rights reserved.
//

import UIKit

struct ChatMessage {
    var message: String
    var isIncoming: Bool
    var date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
    
    func reduceToMonthDayYear() -> Date {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let year = calendar.component(.year, from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: "\(day)/\(month)/\(year)") ?? Date()
    }
}


class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        attemptToAssembleGroupedMessages()
    }

    func attemptToAssembleGroupedMessages() {
        let groupedMessages = Dictionary(grouping: chatMessages) { (element) -> Date in
            return element.date.reduceToMonthDayYear()
        }
        
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let value = groupedMessages[key]
            messages.append(value ?? [])
        }
    }
    
    
    var messages = [[ChatMessage]]()
    var id = "messageCell"
    
    let chatMessages = [
        ChatMessage(message: "Hello, my name is Jeff", isIncoming: false, date: Date.dateFromCustomString(customString: "09/12/2018")),
        ChatMessage(message: "My name is Jeff too", isIncoming: true, date: Date.dateFromCustomString(customString: "09/12/2018")),
        ChatMessage(message: "Wow, what a coincidence", isIncoming: false, date: Date.dateFromCustomString(customString: "09/12/2018")),
        ChatMessage(message: "Well, now that we've got to know each other, how about I  tell you a little story. Yesterday I programmed this super cool app that we all know about :)", isIncoming: true, date: Date.dateFromCustomString(customString: "12/01/2019")),
        ChatMessage(message: "Well, now that we've got to know each other, how about I  tell you a little story. Yesterday I programmed this super cool app that we all know about :)", isIncoming: true, date: Date.dateFromCustomString(customString: "12/01/2019"))
    ]
    
    func setupView() {
        navigationItem.title = "Messages"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1843137255, green: 0.4509803922, blue: 0.8784313725, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 22)!,
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        tableView.clipsToBounds = true
        tableView.separatorStyle = .none
        tableView.register(MessageCell.self, forCellReuseIdentifier: id)
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1)
    }

    class HeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont(name: "AvenirNext-Medium", size: 14)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20, height: height)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = messages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = HeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as! MessageCell
        cell.chatMessage = messages[indexPath.section][indexPath.row]
        
        return cell
    }
    
}

