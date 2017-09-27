//
//  Targets.swift
//  FPS AR
//
//  Created by Caleb Wells on 9/26/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit

class Targets: SKSpriteNode {
    var targetSprites: SKSpriteNode = SKSpriteNode()
    
    func setUpSprites(_ name: String) {
        let targetTexture = SKTexture(imageNamed: name)
        targetSprites = SKSpriteNode(texture:targetTexture)
                
        let fly: SKAction = SKAction.move(by: CGVector(dx: 800, dy: 800), duration: 4) //0.8)
        fly.timingMode = .easeIn
        
        let repeatForever: SKAction = SKAction.repeatForever(fly)
        
        targetSprites.run(repeatForever)
        
        let frame2 = SKTexture(imageNamed: "Ducky_F02")
        let frame3 = SKTexture(imageNamed: "Ducky_F03")
        let frame4 = SKTexture(imageNamed: "Ducky_F04")
        
        let animation = SKAction.animate(with: [targetTexture, frame2, frame3, frame4], timePerFrame: 0.3)
        let runForever = SKAction.repeatForever(animation)
        
        targetSprites.run(runForever)
        
        self.addChild(targetSprites)
    }
}

enum SetupState {
    case addTarget
}

class Helper {
    static var stringName: String = ""
    static var setupState: SetupState = .addTarget
}
