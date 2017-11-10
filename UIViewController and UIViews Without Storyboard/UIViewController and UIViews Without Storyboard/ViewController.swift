//
//  ViewController.swift
//  UIViewController and UIViews Without Storyboard
//
//  Created by Caleb Wells on 11/9/17.
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "A Title Label in Swift!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        headerView.addSubview(titleLabel)
        setUpHeaderAndTitle()
        
        let frame = view.frame
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        view.addSubview(collectionView)
        setUpCollectionView()
    }
    
    func setUpHeaderAndTitle() {
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setUpCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
    }
}

