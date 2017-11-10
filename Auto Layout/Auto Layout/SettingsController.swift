//
//  SettingsController.swift
//  Auto Layout
//
//  Created by Caleb Wells on 11/9/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    let doneButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainPink
        
        view.addSubview(doneButton)
        setUpLayout()
    }
    
    func setUpLayout() {
        doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 260).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleDone() {
        print("=== hello")
        dismiss(animated: true, completion: nil)
    }
}
