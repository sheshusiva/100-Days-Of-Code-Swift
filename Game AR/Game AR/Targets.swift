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
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        let point = touch.location(in: self)
//        
//        let hit = nodes(at: point)
//        
//        if let nodes = hit.first {
//            if nodes == targetSprites {
//                let death = SKAction.fadeOut(withDuration: 0.5)
//                let remove = SKAction.removeFromParent()
//                
//                // Group the fade out and sound actions
//                let groupKillingActions = SKAction.group([death, gunSound])
//                // Create an action sequence
//                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
//                
//                // Excecute the actions
//                nodes.run(sequenceAction)
//                
//                // Update the score
//                score += 10
//            }
//        }
//    }
}
