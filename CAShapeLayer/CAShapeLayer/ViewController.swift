//
//  ViewController.swift
//  CAShapeLayer
//
//  Created by Caleb Wells on 11/27/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.bounds = CGRect(x: 0.0, y: 0.0, width: 120.0, height: 120.0)
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.path = UIBezierPath(rect: shapeLayer.bounds).cgPath
        
    }
}

