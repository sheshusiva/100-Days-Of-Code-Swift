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
    var timeLeft = 0
    
    let timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Timer!", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(startTimerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let timeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
       return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Timer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(timerButton)
        timerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(timeLabel)
        timeLabel.text = "Time left: \(timeLeft)"
        timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: timerButton.topAnchor, constant: -100).isActive = true
    }
    
    @objc func startTimerButton() {
        print("=== Start the timer!!!")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerIsRunning), userInfo: nil, repeats: true)
    }
    
    @objc func timerIsRunning() {
        timeLeft += 1
        timeLabel.text = "Time left: \(timeLeft)"
        print("=== time left \(timeLeft)")
//        if view.backgroundColor == .white {
//            view.backgroundColor = .yellow
//        } else if view.backgroundColor == .yellow {
//            view.backgroundColor = .white
//        }
        
    }
    
}

