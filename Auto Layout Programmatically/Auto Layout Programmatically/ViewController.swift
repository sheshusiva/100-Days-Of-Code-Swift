//
//  ViewController.swift
//  Auto Layout Programmatically
//
//  Created by Caleb Wells on 10/1/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let imageNames = [#imageLiteral(resourceName: "s1"),#imageLiteral(resourceName: "s2"),#imageLiteral(resourceName: "s3"),#imageLiteral(resourceName: "s4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        view.backgroundColor = .white
        
        let currentViewController = ViewController()
        currentViewController.imageName = imageNames.first
        let viewControllers = [currentViewController]
        setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentImageName = (viewControllers as! ViewController).imageName
        let currentIndex = imageNames.index(of: currentImageName!)
        
        if currentIndex < imageNames.count -1 {
            let currentViewController = ViewController()
            currentViewController.imageView = imageNames[currentIndex! +1]
            return currentViewController
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}

class ViewController: UIViewController {
    
    var imageName: String? {
        didSet {
            imageView.image = UIImage(named: imageName!)
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.text = "Start by opening Settings."
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        stepOneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stepOneImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stepOneImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stepOneImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: stepOneImageView.bottomAnchor, constant: 100).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
