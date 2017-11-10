//
//  ViewController.swift
//  UIViewController and UIViews Without Storyboard
//
//  Created by Caleb Wells on 11/9/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let headerView: UIView = {
        let header = UIView()
        header.backgroundColor = .red
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        
        seUpViewLayout()
    }
    
    func seUpViewLayout() {
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
    }
}

