//
//  IntroController.swift
//  Login Page
//
//  Created by Caleb Wells on 10/29/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class IntroController: UIViewController {
    
    let introTextView: UITextView = {
        let textView = UITextView()
        textView.text = "New and interesting stuff."
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "introImage"))
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
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
        
        view.addSubview(introTextView)
        view.addSubview(imageView)
        view.addSubview(loginButton)
        
        setupIntroTextView()
        setupImageView()
        setupLoginButton()
    }
    
    func setupIntroTextView() {
        introTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        introTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        introTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        introTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupImageView() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: -100).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
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
