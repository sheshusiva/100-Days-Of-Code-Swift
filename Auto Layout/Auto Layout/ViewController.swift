//
//  ViewController.swift
//  Auto Layout
//
//  Created by Caleb Wells on 11/4/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 255/255, green: 104/255, blue: 179/255, alpha: 1.0)
    static var mainPinkHalf = UIColor(red: 255/255, green: 104/255, blue: 179/255, alpha: 0.5)
}

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "game"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let textView: UITextView = {
        let text = UITextView()
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 18)
        text.text = "Join us today in our fun in games!"
        text.isEditable = false
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.mainPinkHalf, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.mainPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = .mainPink
        pageControl.pageIndicatorTintColor = .mainPinkHalf
        return pageControl
    }()
    
    //MARK: === View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(textView)
        
        setupImageView()
        setupTextView()
        setupBottomControls()
    }
    
    //MARK: === Set up layout
    func setupImageView() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupTextView() {
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupBottomControls() {
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

