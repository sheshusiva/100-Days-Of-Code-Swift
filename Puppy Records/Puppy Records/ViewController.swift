//
//  ViewController.swift
//  Puppy Records
//
//  Created by Caleb Wells on 12/10/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Puppy Records"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

