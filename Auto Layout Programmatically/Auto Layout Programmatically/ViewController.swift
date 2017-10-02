//
//  ViewController.swift
//  Auto Layout Programmatically
//
//  Created by Caleb Wells on 10/1/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stepOneImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "s1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.text = "Start by opening Settings."
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stepOneImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        stepOneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stepOneImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stepOneImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stepOneImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: stepOneImageView.bottomAnchor, constant: 100).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

