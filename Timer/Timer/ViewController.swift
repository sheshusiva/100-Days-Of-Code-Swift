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
    var timeLeft = 4 // needs to be 1500!
    
    let startTimerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Timer!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(startTimerButtonFunc), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(startTimerButton)
        startTimerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startTimerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func startTimerButtonFunc() {
        print("=== Start the timer!!!")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunning), userInfo: nil, repeats: true)
    }
    
    @objc func timerIsRunning() {
        timeLeft -= 1
        print("=== time left \(timeLeft)")
        
        if timeLeft > 0 {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
            timer.invalidate()
            timeLeft = 4
        }
    }
    
}

