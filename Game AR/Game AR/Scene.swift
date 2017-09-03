//
//  Scene.swift
//  Game AR
//
//  Created by Caleb Wells on 8/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

var xTranslation = -21
var zTranslation = -9

var scoreLabel: SKLabelNode!

var score = 0 {
    didSet {
        scoreLabel.text = "SCORE: \(score)"
    }
}

var targetTexture = SKTexture()
var targetSprites: SKSpriteNode = SKSpriteNode()

let gunTexture = SKTexture(imageNamed: "Shoot_F01")
var gunShooting: SKSpriteNode = SKSpriteNode()
var gunSprite: SKSpriteNode = SKSpriteNode()

class Scene: SKScene, SKPhysicsContactDelegate {
    
    var spawn = 0
    
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
        physicsWorld.contactDelegate = self
        
        gunSprite.zPosition = -50
        gunShooting.zPosition = 50
        
        gun()
        gameCenterIcon()
        createScore()
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
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node == targetSprites || contact.bodyB.node == targetSprites {
            
            targetSprites.removeFromParent()
            print("-- Did contact??")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: self.view)
        
        if point.x > size.width / 2 && point.y < size.width / 2 {
            gunShoooting(1)
            gunSprite.isHidden = true
            gunShooting.removeFromParent()
            addChild(gunShooting)
            score += 10
        }
    }
    
    func gunShoooting(_ number: Int) {
        
        gunShooting = SKSpriteNode(texture:gunTexture)
        
        if number == 1 {
            print("===== BANG!!! BANG!!!")
            
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
            
            gunShooting.physicsBody = SKPhysicsBody(texture: gunTexture, size: gunTexture.size())
            gunShooting.physicsBody?.isDynamic = false
        }
    }
    
    func gun() {
        let gunTexture = SKTexture(imageNamed: "Shoot_F01")
        gunSprite = SKSpriteNode(texture:gunTexture)
        
        gunSprite.scale(to: CGSize(width: 200, height: 200))
        gunSprite.position = CGPoint(x: 0, y: (view?.frame.midY)! - 320)
        gunSprite.zPosition = -50
        addChild(gunSprite)
    }
}

class Targets: SKSpriteNode, SKPhysicsContactDelegate {
    
    func setUpSprites(_ name: String) {
        targetTexture = SKTexture(imageNamed: name)
        targetSprites = SKSpriteNode(texture:targetTexture)
        
        let fly: SKAction = SKAction.move(by: CGVector(dx: 1200, dy: 800), duration: 0.3)
        fly.timingMode = .easeIn
        
        let repeatForever: SKAction = SKAction.repeatForever(fly)
        
        targetSprites.run(repeatForever)
        
        let frame2 = SKTexture(imageNamed: "Ducky_F02")
        let frame3 = SKTexture(imageNamed: "Ducky_F03")
        
        let animation = SKAction.animate(with: [targetTexture, frame2, frame3], timePerFrame: 0.1)
        let runForever = SKAction.repeatForever(animation)
        
        targetSprites.zPosition = -72
        targetSprites.run(runForever)
        
        addChild(targetSprites)
        
        targetSprites.physicsBody = SKPhysicsBody(texture: targetTexture, size: targetTexture.size())
        targetSprites.physicsBody!.contactTestBitMask = targetSprites.physicsBody!.collisionBitMask
        targetSprites.physicsBody?.isDynamic = false
        
        targetSprites.physicsBody?.collisionBitMask = 0
    }
}

enum SetupState {
    case addTarget
}

class Helper {
    static var stringName: String = ""
    static var setupState: SetupState = .addTarget
}
