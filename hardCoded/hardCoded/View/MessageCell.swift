//
//  MessageCell.swift
//  hardCoded
//
//  Created by Finn Kiesinger on 23.02.19.
//  Copyright © 2019 devCore. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    var messageLabel = UILabel()
    var bubbleView = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            self.messageLabel.textColor = .black
            self.bubbleView.backgroundColor = chatMessage.isIncoming ? .white : #colorLiteral(red: 0.3647058824, green: 0.7921568627, blue: 0.3529411765, alpha: 1)
            self.messageLabel.text = chatMessage.message
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont(name: "AvenirNext-Medium", size: 17)
        bubbleView.backgroundColor = .green
        bubbleView.layer.cornerRadius = 12
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleView)
        addSubview(messageLabel)
        
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
        ]
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        leadingConstraint.isActive = false
        trailingConstraint.isActive = true
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
