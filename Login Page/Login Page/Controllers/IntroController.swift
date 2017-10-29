//
//  IntroController.swift
//  Login Page
//
//  Created by Caleb Wells on 10/29/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class IntroController: UIViewController {
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 13/255, green: 0/255, blue: 204/255, alpha: 1.0)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToRegisterScreen), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(loginButton)
        setupLoginButton()
    }
    
    func setupLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func goToRegisterScreen() {
        let loginController = LogInController()
        present(loginController, animated: true, completion: nil)
    }
}
