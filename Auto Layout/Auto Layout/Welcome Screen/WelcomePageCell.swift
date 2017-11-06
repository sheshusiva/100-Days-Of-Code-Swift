//
//  WelcomePageCell.swift
//  Auto Layout
//
//  Created by Caleb Wells on 11/6/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class WelcomePageCell: UICollectionViewCell {
    
    var page: WelcomePageModel? {
        didSet {
            guard let unwrappedPage = page else { return }
            
            imageView.image = UIImage(named: unwrappedPage.imageViews)
        }
    }
    
    private let imageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "game"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let textView: UITextView = {
        let text = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun in games!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        text.attributedText = attributedText
        text.textAlignment = .center
        text.isEditable = false
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(textView)
        
        setupImageView()
        setupTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: === Set up layout
    func setupImageView() {
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 72).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupTextView() {
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
