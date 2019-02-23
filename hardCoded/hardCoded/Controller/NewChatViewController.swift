//
//  NewChatViewController.swift
//  hardCoded
//
//  Created by Finn Kiesinger on 23.02.19.
//  Copyright © 2019 devCore. All rights reserved.
//

import UIKit

class NewChatViewController: UIViewController {

    class HeaderView: UIView {
        let backButton = UIButton()
        override init(frame: CGRect) {
            super.init(frame: frame)
            backButton.imageView?
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    let header = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(header)
        view.backgroundColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: header.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: header.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 100).isActive = true
        header.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.4509803922, blue: 0.8784313725, alpha: 1)
    }

}
