//
//  ViewController.swift
//  Generating UIButtons from a loop
//
//  Created by Caleb Wells on 12/7/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let letterArray = ["A","B","C","D","E"]
    
    @objc func handleButtonPress() {
        print("=== Hello ===")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var buttonX: CGFloat = -30
        
        for letter in letterArray {
            
            let letterButton = UIButton(frame: CGRect(x: buttonX, y: 200, width: 250, height: 30))
            buttonX = buttonX + 50
            
            letterButton.setTitle("\(letter)", for: .normal)
            letterButton.setTitleColor(.black, for: .normal)
            letterButton.addTarget(self, action: #selector(handleButtonPress), for: .touchUpInside)
            view.addSubview(letterButton)
        }
        
    }
}

