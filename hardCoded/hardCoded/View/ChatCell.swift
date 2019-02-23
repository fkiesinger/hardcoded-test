//
//  ChatCell.swift
//  hardCoded
//
//  Created by Finn Kiesinger on 23.02.19.
//  Copyright © 2019 devCore. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    var nameLabel = UILabel()
    var messageLabel = UILabel()
    var profileImage = UIImageView()
    var latestMessageDateLabel = UILabel()
    
    var chat: Chat! {
        didSet {
            profileImage.image = UIImage(named: "user")
            self.nameLabel.text = chat.members[0]
            self.messageLabel.text = chat.latestMessage
            self.latestMessageDateLabel.text = "17:12"
            //self.messageLabel.text = chat.latestMessage
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        messageLabel.numberOfLines = 1
        messageLabel.font = UIFont(name: "AvenirNext-Regular", size: 15)
        messageLabel.textColor = #colorLiteral(red: 0.3685247302, green: 0.3663391173, blue: 0.3702080548, alpha: 1)
        latestMessageDateLabel.font = UIFont(name: "AvenirNext-Regular", size: 12)
        nameLabel.font = UIFont(name: "AvenirNext-Bold", size: 17)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        latestMessageDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(latestMessageDateLabel)
        addSubview(messageLabel)
        
        
        let constraints = [
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            messageLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: latestMessageDateLabel.leadingAnchor, constant: -8),
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            messageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            latestMessageDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            latestMessageDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            latestMessageDateLabel.widthAnchor.constraint(equalToConstant: 40),
            latestMessageDateLabel.heightAnchor.constraint(equalToConstant: 10)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
