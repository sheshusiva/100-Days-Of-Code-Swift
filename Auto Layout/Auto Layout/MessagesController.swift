//
//  MessagesController.swift
//  Auto Layout
//
//  Created by Caleb Wells on 11/6/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class MessagesController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
//        let homeController = HomeController()
//        present(homeController, animated: true, completion: nil)
    }
}
