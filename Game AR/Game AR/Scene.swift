//
//  Scene.swift
//  Game AR
//
//  Created by Caleb Wells on 8/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

var xTranslation = -5
var zTranslation = -9

var targetSprites: SKSpriteNode = SKSpriteNode()
let gunTexture = SKTexture(imageNamed: "Shoot_F01")
var gunShooting: SKSpriteNode = SKSpriteNode()

let noCategory: UInt32 = 0
let targetCategory: UInt32 = 1
let gunCategory: UInt32 = 2

class Scene: SKScene {
    
    var spawn = 0
    
    func CreateSprite() {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Change xTranslation value before each frame is rendered
        if xTranslation == -5 {
            xTranslation = -1
        } else if xTranslation == -1 {
            xTranslation = 5
        } else if xTranslation == 5 {
            xTranslation = -5
        }
        
        // Change zTranslation value before each frame is rendered
        if zTranslation == -9 {
            zTranslation = -27
        } else if zTranslation == -27 {
            zTranslation = -16
        } else if zTranslation == -16 {
            zTranslation = -9
        }
        
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            
            // Create a transform with a translation
            var translation = matrix_identity_float4x4
            translation.columns.3.x = -16 //Float(xTranslation)
            translation.columns.3.y = -9
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
    
    override func didMove(to view: SKView) {
        // Setup your scene
        targetSprites.physicsBody?.categoryBitMask = targetCategory
        targetSprites.physicsBody?.contactTestBitMask = gunCategory
        
        gunShooting.physicsBody?.categoryBitMask = gunCategory
        gunShooting.physicsBody?.contactTestBitMask = targetCategory
        
        gunShoooting(0)
        gameCenterIcon()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        contact.bodyA.node?.removeFromParent()
        contact.bodyB.node?.removeFromParent()

        print("--- Contact! ----")
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: self.view)
        
        if point.x > size.width / 2 && point.y < size.width / 2 {
            gunShoooting(1)
            gunShoooting(2)
        }
    }
    
    func gunShoooting(_ number: Int) {
        
        gunShooting = SKSpriteNode(texture:gunTexture)
        
        if number == 1 {
            print("===== HELLO?????")
            
            gunShooting.scale(to: CGSize(width: 250, height: 250))
            gunShooting.position = CGPoint(x: 0, y: (view?.frame.midY)! - 300)
            
            let frame2 = SKTexture(imageNamed: "Shoot_F02")
            let frame3 = SKTexture(imageNamed: "Shoot_F03")
            let frame4 = SKTexture(imageNamed: "Shoot_F04")
            let frame5 = SKTexture(imageNamed: "Shoot_F05")
            let frame6 = SKTexture(imageNamed: "Shoot_F06")
            
            let animation = SKAction.animate(with: [gunTexture, frame2, frame3, frame4, frame5, frame6, gunTexture], timePerFrame: 0.2)
            
            gunShooting.run(animation)
            
            self.addChild(gunShooting)
        } else if number == 0 {
            print("===== WTF?????")
            let gun = SKSpriteNode(texture:gunTexture)

            gun.scale(to: CGSize(width: 250, height: 250))
            gun.position = CGPoint(x: 0, y: (view?.frame.midY)! - 300)

            self.addChild(gun)
        } else if number == 2 {
            print("===== 2222222?????")
            let gun = SKSpriteNode(texture:gunTexture)
            
            gun.scale(to: CGSize(width: 250, height: 250))
            gun.position = CGPoint(x: 0, y: (view?.frame.midY)! - 300)
            
            gunShooting.isHidden = true
        }
    }
}

class Targets: SKSpriteNode {
    
    func setUpSprites(_ name: String) {
        let targetTexture = SKTexture(imageNamed: name)
        targetSprites = SKSpriteNode(texture:targetTexture)
        
        let fly: SKAction = SKAction.move(by: CGVector(dx: 800, dy: 800), duration: 0.8)
        fly.timingMode = .easeIn
        
        let repeatForever: SKAction = SKAction.repeatForever(fly)
        
        targetSprites.run(repeatForever)
        
        let frame2 = SKTexture(imageNamed: "Ducky_F02")
        let frame3 = SKTexture(imageNamed: "Ducky_F03")
        
        let animation = SKAction.animate(with: [targetTexture, frame2, frame3], timePerFrame: 0.18)
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
