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
    
    let addBarButton: UIButton = {
        let barButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        barButton.setTitle("+", for: .normal)
        barButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 38)
        barButton.setTitleColor(.white, for: .normal)
        barButton.layer.cornerRadius = 12
        barButton.layer.masksToBounds = true
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Puppy Records"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightButton = UIBarButtonItem(customView: addBarButton)
        navigationItem.rightBarButtonItem = rightButton
        
        tableView.register(PuppyCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    @objc func handleAddButton() {
        print("=== Add button tapped")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = "Hello Puppy name"
        
        return cell
    }
    
//    func showPuppyDetails(puppy: Puppy) {
//        let puppyController = PuppyController()
//        navigationController?.pushViewController(puppyController, animated: true)
//    }
}

