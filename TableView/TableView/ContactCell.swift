//
//  ContactCell.swift
//  TableView
//
//  Created by Caleb Wells on 11/24/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = UIColor(red: 11/255, green: 79/255, blue: 108/170, alpha: 1.0)
        
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        starButton.tintColor = .lightGray
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.addTarget(self, action: #selector(handleStarButton), for: .touchUpInside)
        accessoryView = starButton
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleStarButton(starButton: UIButton) {
        starButton.tintColor = .lightGray
    }
}
