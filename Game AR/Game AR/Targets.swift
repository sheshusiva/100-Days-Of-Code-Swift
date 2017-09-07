//
//  Targets.swift
//  Game AR
//
//  Created by Caleb Wells on 9/6/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

class Targets: SKSpriteNode {
    
    var targetTexture = SKTexture()
    var targetSprites = SKSpriteNode()
    
    func setUpSprites(_ name: String) {
        targetTexture = SKTexture(imageNamed: name)
        targetSprites = SKSpriteNode(texture:targetTexture)
        
        let fly: SKAction = SKAction.move(by: CGVector(dx: 1200, dy: 800), duration: 0.3)
        fly.timingMode = .easeIn
        
        let repeatForever: SKAction = SKAction.repeatForever(fly)
        
        targetSprites.run(repeatForever)
        
        //let frame2 = SKTexture(imageNamed: "Ducky_F02")
        let frame3 = SKTexture(imageNamed: "Ducky_F03")
        let frame4 = SKTexture(imageNamed: "Ducky_F04")
        let frame5 = SKTexture(imageNamed: "Ducky_F05")
        
        let animation = SKAction.animate(with: [targetTexture, frame3, frame4, frame5], timePerFrame: 0.12)
        let runForever = SKAction.repeatForever(animation)
        
        targetSprites.zPosition = -72
        targetSprites.run(runForever)
        
        addChild(targetSprites)
    }
}

enum SetupState {
    case addTarget
}
