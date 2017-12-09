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
        label.text = "UISlider"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 20, y: 260, width: 280, height: 20))
        slider.minimumValue = 1
        slider.maximumValue = 24
        slider.isContinuous = true
        slider.value = 12
        slider.tintColor = #colorLiteral(red: 0.9995597005, green: 0, blue: 0, alpha: 1)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(handleSlider), for: .valueChanged)
        return slider
    }()
    
    @objc func handleSlider(sender: UISlider!) {
        print(sender.value)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(headerView)
        view.addSubview(slider)

        setUpLayout()
    }

    func setUpLayout() {
        setUpHeader()

        slider.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: 300).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 40).isActive = true
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

