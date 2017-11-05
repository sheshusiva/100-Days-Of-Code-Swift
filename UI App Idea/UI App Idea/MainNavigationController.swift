//
//  MainNavigationController.swift
//  UI App Idea
//
//  Created by Caleb Wells on 11/1/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let editButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(actionEdit))
        navigationItem.leftBarButtonItem = editButtonItem
        
        navigationItem.title = "Hello?"
        
        if isLoggedIn() {
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
        
        setupNavigationBarItems()
    }
    
    @objc func actionEdit() {
        print("=== 123")
    }
    
    func isLoggedIn() -> Bool {
        return false
    }
    
    @objc func showLoginController() {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    func setupNavigationBarItems() {
        let profileButton = UIButton(type: .system)
        profileButton.setImage(#imageLiteral(resourceName: "avatar").withRenderingMode(.alwaysOriginal), for: .normal)
        profileButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let homeImageView = UIImageView(image: #imageLiteral(resourceName: "home"))
        homeImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        homeImageView.contentMode = .scaleAspectFit
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileButton)
        navigationItem.titleView = homeImageView
    }
    
    @objc func profileButton() {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func messagesButton() {
        //
    }
}


