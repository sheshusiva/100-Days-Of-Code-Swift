//
//  GameScene.swift
//  FPS AR
//
//  Created by Caleb Wells on 9/26/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import ARKit

class GameScene: SKScene {
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
    
    override func update(_ currentTime: TimeInterval) {
        if !isWorldSetUp {
            setUpWorld()
        }
        
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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = gun.position
        let hitNodes = nodes(at: location)
        
        var hitTarget: SKNode?
        for node in hitNodes {
            if node.name == "target" {
                hitTarget = node
                break
            }
        }
        
        if let hitTarget = hitTarget, let anchor = sceneView.anchor(for: hitTarget) {
            let hit = SKAction.playSoundFileNamed("quack", waitForCompletion: false)
            
            let action = SKAction.run {
                self.sceneView.session.remove(anchor: anchor)
            }
            
            let group = SKAction.group([hit, action])
            let sequence = [SKAction.wait(forDuration: 0.3), group]
            hitTarget.run(SKAction.sequence(sequence))
            
        }
        
        let bang = SKAction.playSoundFileNamed("gun-shot", waitForCompletion: false)
        let frame1 = SKTexture(imageNamed: "Gun_F01")
        let frame2 = SKTexture(imageNamed: "Gun_F02")
        let frame3 = SKTexture(imageNamed: "Gun_F03")
        
        let animation = SKAction.animate(with: [frame2, frame3, frame1], timePerFrame: 0.3)
        
        let group = SKAction.group([bang, animation])
        
        gun.run(group)
        
    }
}
