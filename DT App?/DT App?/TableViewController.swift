//
//  TableViewController.swift
//  DT App?
//
//  Created by Caleb Wells on 9/19/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellId = "cellId"
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Daily Travels"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editButton))
        
        tableView.register(TableViewCellLayout.self, forCellReuseIdentifier: cellId)
    }
    
    @objc func addButton() {
        //
    }
    
    @objc func editButton() {
        //
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionOne = UIContextualAction(style: .normal, title: "Action One") {
            action, view, completionHandler in
            print("Action One")
            completionHandler(true)
        }
        
        let actionTwo = UIContextualAction(style: .normal, title: "Action Two") {
            action, view, completionHandler in
            print("Action Two")
            completionHandler(true)
        }
        
        actionOne.backgroundColor = UIColor.blue
        actionTwo.backgroundColor = UIColor.magenta
        
        return UISwipeActionsConfiguration(actions: [actionOne, actionTwo])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class TableViewCellLayout: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellLabel: UILabel = {
       let label = UILabel()
        label.text = "Test label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupSubViews() {
        addSubview(cellLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": cellLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": cellLabel]))
    }
}

