//
//  ViewController.swift
//  Timer
//
//  Created by Caleb Wells on 10/19/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    
    let timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Timer!", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(startTimerButton), for: .touchUpInside)
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
    
    @objc func startTimerButton() {
        print("=== Start the timer!!!")
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerIsRunning), userInfo: nil, repeats: true)
    }
    
    @objc func timerIsRunning() {
        print("=== timer is running!")
        if view.backgroundColor == .white {
            view.backgroundColor = .yellow
        } else if view.backgroundColor == .yellow {
            view.backgroundColor = .white
        }
        
    }
}

