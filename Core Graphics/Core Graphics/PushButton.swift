//
//  PushButton.swift
//  Core Graphics
//
//  Created by Caleb Wells on 11/16/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class PushButton: UIButton {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
    }
}
