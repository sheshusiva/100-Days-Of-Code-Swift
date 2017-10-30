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
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let termsTextView: UITextView = {
        let textView = UITextView()
        textView.text = "By signing in you agree to the terms of service and privacy policy."
        textView.textAlignment = .center
        textView.textColor = .gray
        textView.isEditable = false
        textView.isScrollEnabled = false
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
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = UIColor(red: 228/255, green: 62/255, blue: 136/255, alpha: 1.0)
        pageControl.pageIndicatorTintColor = UIColor(red: 228/255, green: 62/255, blue: 136/255, alpha: 0.5)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 228/255, green: 62/255, blue: 136/255, alpha: 1.0)
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
        view.addSubview(pageControl)
        view.addSubview(loginButton)
        view.addSubview(termsTextView)
        
        setupIntroTextView()
        setupImageView()
        setupPageControl()
        setupLoginButton()
        setupTermsTextView()
    }
    
    func setupIntroTextView() {
        introTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        introTextView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -200).isActive = true
        introTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        introTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupImageView() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupPageControl() {
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTermsTextView() {
        termsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        termsTextView.topAnchor.constraint(equalTo: loginButton.topAnchor, constant: 70).isActive = true
        termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        termsTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func goToRegisterScreen() {
        let loginController = LogInController()
        present(loginController, animated: true, completion: nil)
    }
}
