//
//  ViewController.swift
//  Why is UIViewController so Important?
//
//  Created by Caleb Wells on 11/15/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView: UIView = {
        let redView = UIView()
        redView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        redView.backgroundColor = .red
        redView.layer.cornerRadius = 12
        redView.layer.masksToBounds = true
        return redView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        view.addSubview(redView)
        redView.center = view.center
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.redView.center = self.view.center
        }, completion: nil)
        
        print("=== Did rotate device")
    }
}

