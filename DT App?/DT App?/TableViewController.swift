//
//  TableViewController.swift
//  DT App?
//
//  Created by Caleb Wells on 9/19/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Daily Travels"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editButton))
    }
    
    @objc func addButton() {
        //
    }
    
    @objc func editButton() {
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

