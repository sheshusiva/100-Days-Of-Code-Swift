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
        textView.text = "Start by opening Settings."
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stepOneImageView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        stepOneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stepOneImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stepOneImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stepOneImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

