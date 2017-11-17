//
//  PushButton.swift
//  Core Graphics
//
//  Created by Caleb Wells on 11/16/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class PushButton: UIButton {
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).setFill()
        path.fill()
        
        // Set up the width and height variables for the horizontal stroke.
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        // Create the path.
        let plusPath = UIBezierPath()
        
        // Set the path's line width to the height of the stroke.
        plusPath.lineWidth = Constants.plusLineWidth
        
        // Move the initial point of the path to the start of the horizontal stroke.
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth,
            y: halfHeight))
        
        // Add a point to the path at the end of the stroke.
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth,
            y: halfHeight))
        
        // Set the stroke color.
        UIColor.white.setStroke()
        
        // Draw the stroke
        plusPath.stroke()
    }
}
