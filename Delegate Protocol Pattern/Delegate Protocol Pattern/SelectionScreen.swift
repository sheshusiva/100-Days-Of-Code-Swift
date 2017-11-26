//
//  SelectionScreen.swift
//  Delegate Protocol Pattern
//
//  Created by Caleb Wells on 11/25/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

protocol SelectionDelegate {
    func didSelect(image: UIImage, name: String, color: UIColor)
}

class SelectionScreen: UIViewController {
    
    var selectionDelegate: SelectionDelegate!
    
    let buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button One", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleOneButton), for: .touchUpInside)
        return button
    }()
    
    let buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button Two", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTwoButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        
        setUpLayouts()
    }
    
    //MARK: === Set up layouts.
    func setUpLayouts() {
        buttonOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        buttonOne.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        buttonOne.widthAnchor.constraint(equalToConstant: 320).isActive = true
        buttonOne.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 100).isActive = true
        buttonTwo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        buttonTwo.widthAnchor.constraint(equalToConstant: 320).isActive = true
        buttonTwo.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    //MARK: === Handle buttons.
    @objc func handleOneButton() {
        selectionDelegate.didSelect(image: #imageLiteral(resourceName: "merry"), name: "Button One", color: .green)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleTwoButton() {
        selectionDelegate.didSelect(image: #imageLiteral(resourceName: "christmas"), name: "Button Two", color: .red)
        dismiss(animated: true, completion: nil)
    }
}

