//
//  ViewController.swift
//  UI elements
//
//  Created by Caleb Wells on 12/3/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let headerView: UIView = {
        let header = UIView()
        header.backgroundColor = #colorLiteral(red: 1, green: 0.5061584115, blue: 0.1756399274, alpha: 1)
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "UISegmentedControl"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Week", "Month", "Year"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(handleSegmentIndex), for: .touchUpInside)
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        view.addSubview(segmentedControl)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        setUpHeader()
        
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    @objc func handleSegmentIndex(sender: UISegmentedControl!) {
        print(sender.selectedSegmentIndex)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func setUpHeader() {
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerView.addSubview(headerTitle)
        headerTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        headerTitle.centerYAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}

