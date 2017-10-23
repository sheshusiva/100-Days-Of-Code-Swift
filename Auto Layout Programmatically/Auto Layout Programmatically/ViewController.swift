//
//  ViewController.swift
//  Auto Layout Programmatically
//
//  Created by Caleb Wells on 10/22/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView(image: #imageLiteral(resourceName: "puppy"))
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 200).isActive = true
        image.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

