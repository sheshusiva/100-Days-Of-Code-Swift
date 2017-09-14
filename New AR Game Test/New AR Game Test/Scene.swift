//
//  Scene.swift
//  New AR Game Test
//
//  Created by Caleb Wells on 9/9/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

var creationTime : TimeInterval = 0
var scoreLabel: SKLabelNode!
var score = 0 {
    didSet {
        scoreLabel.text = "SCORE: \(score)"
    }
}

class Scene: SKScene {
    
    let killSound = SKAction.playSoundFileNamed("bang", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        createScore()
    }
    
    func createScore() {
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.fontSize = 27
        scoreLabel.fontColor = .black
        
        scoreLabel.position = CGPoint(x: (view?.frame.midX)! - 0, y: (view?.frame.midY)! + 180)
        scoreLabel.text = "SCORE: 0"
        
        self.addChild(scoreLabel)
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if currentTime > creationTime {
            createSpriteAnchor()
            creationTime = currentTime + TimeInterval(randomFloat(min: 3.0, max: 6.0))
        }
    }
    
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    func createSpriteAnchor(){
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Define 360º in radians
        let _360degrees = 2.0 * Float.pi
        
        // Create a rotation matrix in the X-axis
        let rotateX = simd_float4x4(SCNMatrix4MakeRotation(_360degrees * randomFloat(min: 0.0, max: 1.0), 1, 0, 0))
        
        // Create a rotation matrix in the Y-axis
        let rotateY = simd_float4x4(SCNMatrix4MakeRotation(_360degrees * randomFloat(min: 0.0, max: 1.0), 0, 1, 0))
        
        // Combine both rotation matrices
        let rotation = simd_mul(rotateX, rotateY)
        
        // Create a translation matrix in the Z-axis with a value between 1 and 2 meters
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -12 - randomFloat(min: 0.0, max: 1.0)
        
        // Combine the rotation and translation matrices
        let transform = simd_mul(rotation, translation)
        
        // Create an anchor
        let anchor = ARAnchor(transform: transform)
        
        // Add the anchor
        sceneView.session.add(anchor: anchor)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the first touch
        guard let touch = touches.first else {
            return
        }
        // Get the location in the AR scene
        let location = touch.location(in: self)
        
        // Get the nodes at that location
        let hit = nodes(at: location)
        
        // Get the first node (if any)
        if let node = hit.first {
            if node.name == "duck" {
                let fadeOut = SKAction.fadeOut(withDuration: 0.2)
                let remove = SKAction.removeFromParent()
                
                let groupKillingActions = SKAction.group([fadeOut, killSound])
                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                
                node.run(sequenceAction)
                
                score += 1
            }
            
        }
    }
}
