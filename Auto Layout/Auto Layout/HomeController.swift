//
//  HomeController.swift
//  Auto Layout
//
//  Created by Caleb Wells on 11/6/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "profile").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitleColor(.mainPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleProfile), for: .touchUpInside)
        return button
    }()
    
    let homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitleColor(.mainPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleHome), for: .touchUpInside)
        return button
    }()
    
    let messagesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "messages").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitleColor(.mainPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleMessages), for: .touchUpInside)
        return button
    }()
    
    //MARK: View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpLayout()
    }
    
    //MARK: Set up layout
    func setUpLayout() {
        view.addSubview(profileButton)
        view.addSubview(homeButton)
        view.addSubview(messagesButton)
        
        let buttonsTopStackView = UIStackView(arrangedSubviews: [profileButton, homeButton, messagesButton])
        buttonsTopStackView.distribution = .fillEqually
        buttonsTopStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonsTopStackView)
        
        buttonsTopStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        buttonsTopStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        buttonsTopStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        buttonsTopStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //MARK: === Handle buttons
    @objc func handleProfile() {
        
    }
    
    @objc func handleHome() {
        
    }
    
    @objc func handleMessages() {
        
    }
}


