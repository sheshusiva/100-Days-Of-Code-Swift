//
//  PuppyCell.swift
//  Puppy Records
//
//  Created by Caleb Wells on 12/10/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class PuppyCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Puppy Name"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Puppy details"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUpViews() {
        let imageView: UIImageView = {
            let image = UIImageView(image: #imageLiteral(resourceName: "shih-tzu"))
            image.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            image.layer.cornerRadius = image.frame.size.width / 2
            image.clipsToBounds = true
            image.layer.borderWidth = 6
            image.layer.borderColor = UIColor.blue.cgColor
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 100).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30).isActive = true
        
        addSubview(detailsLabel)
        detailsLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 100).isActive = true
        detailsLabel.centerYAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12).isActive = true
    }
}
