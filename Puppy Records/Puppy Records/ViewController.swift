//
//  ViewController.swift
//  Puppy Records
//
//  Created by Caleb Wells on 12/10/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.title = "Puppy Records"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttributes
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEditButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButton))
        navigationController?.navigationBar.tintColor = .white
        
        tableView.register(PuppyCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    @objc func handleAddButton() {
        let addPuppyController = AddPuppyController()
        navigationController?.pushViewController(addPuppyController, animated: true)
    }
    
    @objc func handleEditButton() {
        print("Edit!")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let puppyController = PuppyController()
        navigationController?.pushViewController(puppyController, animated: true)
    }
}

