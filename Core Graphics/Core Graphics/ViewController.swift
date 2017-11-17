//
//  ViewController.swift
//  Core Graphics
//
//  Created by Caleb Wells on 11/16/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pushButton: UIButton = {
        let button = PushButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pushButton)
        setUpLayout()
    }
    
    func setUpLayout() {
        pushButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 100).isActive = true
        pushButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        pushButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pushButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

