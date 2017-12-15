//
//  AddPuppyController.swift
//  Puppy Records
//
//  Created by Caleb Wells on 12/13/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class AddPuppyController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Add New Puppy"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSaveButton))
        navigationController?.navigationBar.tintColor = .white
        
        view.backgroundColor = .white
    }
    
    @objc func handleSaveButton() {
        print("Saved!")
    }
}
