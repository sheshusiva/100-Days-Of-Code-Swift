//
//  GameScene.swift
//  FPS AR
//
//  Created by Caleb Wells on 9/26/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import ARKit

var scoreLabel: SKLabelNode!

var score = 0 {
    didSet {
        scoreLabel.text = "SCORE: \(score)"
    }
}

class GameScene: SKScene {
    
    let bang = SKAction.playSoundFileNamed("bang.m4a", waitForCompletion: false)
    let hit = SKAction.playSoundFileNamed("quack", waitForCompletion: false)
    
    var spawn = 0
    var spawnCounter = 0
    var xTranslation = -1
    //var zTranslation = -1 //-9
    
    var sceneView: ARSKView {
        return view as! ARSKView
    }
    
    var isWorldSetUp = false
    var gun: SKSpriteNode!
    
    private func setUpWorld() {
        guard let currentFrame = sceneView.session.currentFrame else {
            return
        }
        
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -2
        let transform = currentFrame.camera.transform * translation
        
        let anchor = ARAnchor(transform: transform)
        sceneView.session.add(anchor: anchor)
        
        isWorldSetUp = true
    }
    
    func spawnTimes() {
        if spawn == 100 {
            CreateSprite()
            spawn = 0
        }
        
        if spawnCounter == 900 {
            for node in children {
                if node.name == "target" {
                    node.removeFromParent()
                }
            }
            spawnCounter = 0
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !isWorldSetUp {
            setUpWorld()
        }
        
        spawnCounter += 1
        spawn += 1
        spawnTimes()
        
        guard let currentFrame = sceneView.session.currentFrame, let lightEstimate = currentFrame.lightEstimate else {
            return
        }
        
        let neutralIntensity: CGFloat = 1000
        let ambientIntensity = min(lightEstimate.ambientIntensity, neutralIntensity)
        let blendFactor = 1 - ambientIntensity / neutralIntensity
        
        for node in children {
            if let target = node as? SKSpriteNode {
                target.color = .black
                target.colorBlendFactor = blendFactor
            }
        }
    }
    
    override func didMove(to view: SKView) {
        gun = SKSpriteNode(imageNamed: "Gun_F01")
        gun.position = CGPoint(x: (view.frame.midX) / 8, y: (view.frame.midY) - 340)
        addChild(gun)
        
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.fontSize = 27
        scoreLabel.fontColor = .black
        
        scoreLabel.position = CGPoint(x: 0, y: (view.frame.midY) - 30)
        scoreLabel.text = "SCORE: 0"
        
        addChild(scoreLabel)
        
        let gcT = SKTexture(imageNamed: "gcIcon")
        let gcNode = SKSpriteNode(texture:gcT)
        
        gcNode.scale(to: CGSize(width: 50, height: 50))
        gcNode.position = CGPoint(x: (view.frame.midX) - 640, y: (view.frame.midY) - 380)
        addChild(gcNode)
    }
    
    func CreateSprite() {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Change xTranslation value before each frame is rendered
        if xTranslation == -1 {
            xTranslation = Int(-0.5)
        } else if xTranslation == Int(-0.5) {
            xTranslation = Int(-1.5)
        } else if xTranslation == Int(-1.5) {
            xTranslation = -1
        }
        
        // Change zTranslation value before each frame is rendered
//        if zTranslation == -9 {
//            zTranslation = -27
//        } else if zTranslation == -27 {
//            zTranslation = -16
//        } else if zTranslation == -16 {
//            zTranslation = -9
//        }
        
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            
            // Create a transform with a translation
            var translation = matrix_identity_float4x4
            translation.columns.3.x = Float(xTranslation)
            translation.columns.3.y = -1 //-9
            translation.columns.3.z = -1 //Float(zTranslation)
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = gun.position
        let hitNodes = nodes(at: location)
        
        run(bang)

        var hitTarget: SKNode?
        for node in hitNodes {
            if node.name == "target" {
                hitTarget = node
                run(hit)
                score += 1
                break
            }
        }

        if let hitTarget = hitTarget, let anchor = sceneView.anchor(for: hitTarget) {
//            let hit = SKAction.playSoundFileNamed("quack", waitForCompletion: false)
            
            let action = SKAction.run {
                self.sceneView.session.remove(anchor: anchor)
            }
            
            //let group = SKAction.group([hit, action])
            let sequence = [SKAction.wait(forDuration: 0.2), action]
//            hitTarget.run(hit)
            hitTarget.run(SKAction.sequence(sequence))
            
        }
        // Gun animations and sound
//        let bang = SKAction.playSoundFileNamed("gun-shot", waitForCompletion: false)
        let frame1 = SKTexture(imageNamed: "Gun_F01")
        let frame2 = SKTexture(imageNamed: "Gun_F02")
        let frame3 = SKTexture(imageNamed: "Gun_F03")

        let animation = SKAction.animate(with: [frame2, frame3, frame1], timePerFrame: 0.3)

        //let group = SKAction.group([bang, animation])
        
        gun.run(animation)
    }
}

