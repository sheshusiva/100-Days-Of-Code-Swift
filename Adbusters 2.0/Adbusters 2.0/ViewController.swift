//
//  ViewController.swift
//  Adbusters 2.0
//
//  Created by Caleb Wells on 11/12/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let headerView: UIView = {
        let header = UIView()
        header.backgroundColor = .red
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    let headerLabelView: UILabel = {
        let label = UILabel()
        label.text = "Adbusters"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setUpAdbustersView: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    let setUpAdbustersHeader: UILabel = {
        let label = UILabel()
        label.text = "Set up Adbusters"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setUpAdbustersLabel: UITextView = {
        let text = UITextView()
        text.text =
                    """
                    Follow these simple steps to enable Adbusters.
                    .
                    ∙ Start by opening Settings.
                    ∙ Scroll to Safari and tap it.
                    ∙ Tap on content blockers.
                    ∙ Then enable Adbusters.
                    """
        text.textColor = .gray
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 18)
        text.isEditable = false
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let feedbackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send Feedback", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        view.addSubview(setUpAdbustersView)
        view.addSubview(setUpAdbustersHeader)
        view.addSubview(setUpAdbustersLabel)
        view.addSubview(feedbackButton)
        
        setUpSubViews()
    }
    
    func setUpSubViews() {
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerView.addSubview(headerLabelView)
        headerLabelView.centerYAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerYAnchor).isActive = true
        headerLabelView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        headerLabelView.widthAnchor.constraint(equalTo: headerView.widthAnchor, constant: -12).isActive = true
        headerLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        setUpAdbustersView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        setUpAdbustersView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setUpAdbustersView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -12).isActive = true
        setUpAdbustersView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        setUpAdbustersHeader.topAnchor.constraint(equalTo: setUpAdbustersView.topAnchor, constant: 27).isActive = true
        setUpAdbustersHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setUpAdbustersHeader.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -12).isActive = true
        setUpAdbustersHeader.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        setUpAdbustersLabel.topAnchor.constraint(equalTo: setUpAdbustersHeader.bottomAnchor).isActive = true
        setUpAdbustersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setUpAdbustersLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -12).isActive = true
        setUpAdbustersLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        feedbackButton.topAnchor.constraint(equalTo: setUpAdbustersLabel.bottomAnchor).isActive = true
        feedbackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        feedbackButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        feedbackButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
}

