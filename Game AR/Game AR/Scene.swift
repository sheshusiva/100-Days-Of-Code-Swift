//
//  Scene.swift
//  Game AR
//
//  Created by Caleb Wells on 8/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

enum BodyType: UInt32 {
    case target = 1
    case gun = 2
}

var xTranslation = -21
var yTranslation = -9
var zTranslation = -9

var scoreLabel: SKLabelNode!

var score = 0 {
    didSet {
        scoreLabel.text = "SCORE: \(score)"
    }
}

class Scene: SKScene {
    
    var spawn = 0
    
    override func didMove(to view: SKView) {
        gameCenterIcon()
        createScore()
        
        for node in self.children {
            if let spriteNode: SKSpriteNode = node as? SKSpriteNode {
                Helper.setupStateArray.append(spriteNode)
                spriteNode.removeFromParent()
            }
        }
    }
    
    func CreateSprite() {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Change xTranslation & zTranslation value before each frame is rendered
        if xTranslation == -21 && zTranslation == -9 {
            xTranslation = -11
            zTranslation = -27
        } else if xTranslation == -11 && zTranslation == -27 {
            xTranslation = -5
            zTranslation = -32
        } else if xTranslation == -5 && zTranslation == -32 {
            xTranslation = -21
            zTranslation = -9
        }
        
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            
            // Create a transform with a translation
            var translation = matrix_identity_float4x4
            translation.columns.3.x = Float(xTranslation)
            translation.columns.3.y = Float(yTranslation)
            translation.columns.3.z = Float(zTranslation)
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
        }
    }
    
    func spawnTimes() {
        if spawn == 100 {
            CreateSprite()
            spawn = 0
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        spawn += 1
        spawnTimes()
    }
    
    func gameCenterIcon() {
        let gcT = SKTexture(imageNamed: "gcIcon")
        let gcNode = SKSpriteNode(texture:gcT)

        gcNode.scale(to: CGSize(width: 50, height: 50))
        gcNode.position = CGPoint(x: (view?.frame.midX)! - 640, y: (view?.frame.midY)! - 380)
        self.addChild(gcNode)
    }
    
    func createScore() {
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.fontSize = 27
        scoreLabel.fontColor = .black
        
        scoreLabel.position = CGPoint(x: 0, y: (view?.frame.midY)! - 30)
        scoreLabel.text = "SCORE: 0"
        
        self.addChild(scoreLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let sprite: Targets = Targets()
        if Helper.setupState == .addTarget {
            sprite.setUpSprites("Ducky_F01")
        }
        
        let touch = touches.first!
        let point = touch.location(in: self.view)
        
        if point.x > size.width / 2 && point.y < size.width / 2 {
            //
        }
    }
}
