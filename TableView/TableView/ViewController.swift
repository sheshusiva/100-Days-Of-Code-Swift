//
//  ViewController.swift
//  TableView
//
//  Created by Caleb Wells on 11/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    let twoDimensionalArray = [
        ["Kelsey", "Bill", "Zack", "Scylla", "Orson", "Steve"],
        ["Bob", "Tedd", "Ed"],
        ["Dan"],
        ["Patrick", "Patty"]
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.textColor = .white
        label.backgroundColor = .lightGray
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimensionalArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name = twoDimensionalArray[indexPath.section][indexPath.row]
        cell.textLabel?.text = name
        
        cell.textLabel?.text = "\(name) Section: \(indexPath.section) Row: \(indexPath.row)"
        
        return cell
    }
}

