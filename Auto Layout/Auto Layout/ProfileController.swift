//
//  ProfileController.swift
//  Auto Layout
//
//  Created by Caleb Wells on 11/6/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.mainPink, for: .normal)
        button.setImage(#imageLiteral(resourceName: "setting"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
        return button
    }()
    
    let profileButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "profile"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleProfile), for: .touchUpInside)
        return button
    }()
    
    let homeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "home"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleHome), for: .touchUpInside)
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
        view.addSubview(settingsButton)
        view.addSubview(profileButton)
        view.addSubview(homeButton)
        
        let buttonsTopStackView = UIStackView(arrangedSubviews: [settingsButton, profileButton, homeButton])
        buttonsTopStackView.distribution = .fillEqually
        buttonsTopStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonsTopStackView)
        
        buttonsTopStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        buttonsTopStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        buttonsTopStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        buttonsTopStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //MARK: === Handle buttons
    @objc func handleSettings() {
        let settingsController = SettingsController()
        present(settingsController, animated: true, completion: nil)
    }
    
    @objc func handleProfile() {
        
    }
    
    @objc func handleHome() {
        dismiss(animated: true, completion: nil)
//        let messagesController = MessagesController()
//        present(messagesController, animated: true, completion: nil)
    }
}
