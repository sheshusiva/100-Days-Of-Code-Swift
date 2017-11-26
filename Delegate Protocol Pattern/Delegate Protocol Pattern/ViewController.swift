//
//  ViewController.swift
//  Delegate Protocol Pattern
//
//  Created by Caleb Wells on 11/25/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "merry-christmas"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let chooseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choose", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleChooseButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: === View did load.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 36/255, green: 31/255, blue: 32/255, alpha: 1.0)
        
        view.addSubview(mainImageView)
        view.addSubview(nameLabel)
        view.addSubview(chooseButton)
        
        setUpLayouts()
    }
    
    //MARK: === Set up layouts.
    func setUpLayouts() {
        mainImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 50).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 320).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        chooseButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100).isActive = true
        chooseButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        chooseButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        chooseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //MARK: === Handle button.
    @objc func handleChooseButton() {
        let selectionVC = SelectionScreen()
        selectionVC.selectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
}

extension ViewController: SelectionDelegate {
    func didSelect(image: UIImage, name: String, color: UIColor) {
        mainImageView.image = image
        nameLabel.text = name
        view.backgroundColor = color
    }
}

