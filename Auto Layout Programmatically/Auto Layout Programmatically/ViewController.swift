//
//  ViewController.swift
//  Auto Layout Programmatically
//
//  Created by Caleb Wells on 10/22/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let puppyImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "puppy"))
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(puppyImageView)
        
        puppyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        puppyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        puppyImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        puppyImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

