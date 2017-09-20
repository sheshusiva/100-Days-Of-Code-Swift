//
//  TableViewCellLayout.swift
//  DT App?
//
//  Created by Caleb Wells on 9/19/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class TableViewCellLayout: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Test label"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupSubViews() {
        addSubview(cellLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-35-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": cellLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": cellLabel]))
    }
}
