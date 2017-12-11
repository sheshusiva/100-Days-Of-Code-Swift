//
//  PuppyCell.swift
//  Puppy Records
//
//  Created by Caleb Wells on 12/10/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class PuppyCell: UITableViewCell {
    
    var vc = ViewController()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let detailButton = UIButton(type: .system)
        detailButton.setImage(#imageLiteral(resourceName: "paw"), for: .normal)
        detailButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        detailButton.addTarget(self, action: #selector(handleDetailButton), for: .touchUpInside)
        accessoryView = detailButton
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDetailButton() {
        
    }
}
