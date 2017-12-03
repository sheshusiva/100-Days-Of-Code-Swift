//
//  FeedCell.swift
//  02 LBTA Facebook's News Feed
//
//  Created by Caleb Wells on 11/30/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "woman")
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string: "Person Name", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\nDecember 18 • San Francisco • ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.lightGray]))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "write")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedText
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(55)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(55)]", views: profileImageView)
        addConstraintsWithFormat(format: "V:|-16-[v0]", views: nameLabel)
    }
}

//MARK: === UIView extension.
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: format, metrics: nil, views: viewsDictionary))

    }
}
