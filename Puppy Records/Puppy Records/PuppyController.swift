//
//  PuppyController.swift
//  Puppy Records
//
//  Created by Caleb Wells on 12/10/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class PuppyController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Puppy Details"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEditButton))
        
        view.backgroundColor = .white
    }
    
    @objc func handleEditButton() {
        print("Edit puppy controller!")
    }
}
