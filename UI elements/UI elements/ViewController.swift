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
        label.text = "UIButton"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Hello, button", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleButtonPrss), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        
        view.addSubview(button)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        setUpHeader()
        
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func handleButtonPrss() {
        print("Hello, button.")
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

