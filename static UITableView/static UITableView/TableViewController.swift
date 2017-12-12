//
//  TableViewController.swift
//  static UITableView
//
//  Created by Caleb Wells on 12/11/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let firstNameCell: UITableViewCell = {
        let cell = UITableViewCell()
        cell.backgroundColor = .white
        return cell
    }()
    
    let lastNameCell: UITableViewCell = {
        let cell = UITableViewCell()
        cell.backgroundColor = .white
        return cell
    }()
    
    let feedbackCell: UITableViewCell = {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Feedback"
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.backgroundColor = .white
        return cell
    }()
    
    let checkmarkCell: UITableViewCell = {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Checkmark"
        cell.accessoryType = UITableViewCellAccessoryType.checkmark
        cell.backgroundColor = .white
        return cell
    }()
    
    let switchCell: UITableViewCell = {
        let cell = UITableViewCell()
        cell.backgroundColor = .white
        return cell
    }()
    
    let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Switch"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let onOffSwitch: UISwitch = {
        let onOff = UISwitch()
        onOff.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        onOff.translatesAutoresizingMaskIntoConstraints = false
        return onOff
    }()
    
    @objc func handleSwitch(sender: UISwitch!) {
        print(sender)
    }
    
    let firstNameText: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let lastNameText: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "User Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(firstNameCell)
        view.addSubview(lastNameCell)
        view.addSubview(feedbackCell)
        view.addSubview(checkmarkCell)
        view.addSubview(switchCell)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        firstNameCell.addSubview(firstNameText)
        firstNameText.leadingAnchor.constraint(equalTo: firstNameCell.leadingAnchor, constant: 20).isActive = true
        firstNameText.centerYAnchor.constraint(equalTo: firstNameCell.centerYAnchor).isActive = true
        
        lastNameCell.addSubview(lastNameText)
        lastNameText.leadingAnchor.constraint(equalTo: lastNameCell.leadingAnchor, constant: 20).isActive = true
        lastNameText.centerYAnchor.constraint(equalTo: lastNameCell.centerYAnchor).isActive = true
        
        switchCell.addSubview(switchLabel)
        switchCell.addSubview(onOffSwitch)
        switchLabel.leadingAnchor.constraint(equalTo: switchCell.leadingAnchor, constant: 20).isActive = true
        switchLabel.centerYAnchor.constraint(equalTo: switchCell.centerYAnchor).isActive = true
        
        onOffSwitch.trailingAnchor.constraint(equalTo: switchCell.trailingAnchor, constant: -20).isActive = true
        onOffSwitch.centerYAnchor.constraint(equalTo: switchCell.centerYAnchor).isActive = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        case 2:
            return 2
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return firstNameCell
            case 1:
                return lastNameCell
            default:
                fatalError()
            }
        case 1:
            switch indexPath.row {
            case 0:
                return feedbackCell
            default:
                fatalError()
            }
        case 2:
            switch indexPath.row {
            case 0:
                return checkmarkCell
            case 1:
                return switchCell
            default:
                fatalError()
            }
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Profile"
        case 1:
            return "Contact"
        case 2:
            return "More stuff"
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 1 {
            tableView.deselectRow(at: indexPath, animated: false)
            
            if checkmarkCell.accessoryType == UITableViewCellAccessoryType.none {
                checkmarkCell.accessoryType = UITableViewCellAccessoryType.checkmark
            } else {
                checkmarkCell.accessoryType = UITableViewCellAccessoryType.none
            }
        }
    }
}
