//
//  ViewController.swift
//  Timer
//
//  Created by Caleb Wells on 10/19/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Timer!", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Timer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(timerButton)
        timerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func startTimer() {
        print("=== Start the timer!!!")
    }
    
}

