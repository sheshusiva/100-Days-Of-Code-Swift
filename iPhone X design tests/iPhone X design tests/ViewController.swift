//
//  ViewController.swift
//  iPhone X design tests
//
//  Created by Caleb Wells on 9/15/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func extractedFunc(_ string: String) {
        if string == "Hello" {
            //
        }
    }
    
    func someFunc() {
        let string = "Hello"
        
        extractedFunc(string)
        
    }


}
