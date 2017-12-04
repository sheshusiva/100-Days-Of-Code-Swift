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
        label.text = "UILabel"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, label."
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        view.addSubview(label)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        setUpHeader()
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
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

