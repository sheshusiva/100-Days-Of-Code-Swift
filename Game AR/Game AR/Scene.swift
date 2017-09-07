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
var yTranslation = -9
var zTranslation = -9

var scoreLabel: SKLabelNode!

var score = 0 {
    didSet {
        scoreLabel.text = "SCORE: \(score)"
    }
}

let gunTexture = SKTexture(imageNamed: "Shoot_F01")
var gunShooting: SKSpriteNode = SKSpriteNode()
var gunSprite: SKSpriteNode = SKSpriteNode()

class Scene: SKScene {
    
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
    
    override func didMove(to view: SKView) {
        gun(1)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let sprite: Targets = Targets()
        if Helper.setupState == .addTarget {
            sprite.setUpSprites("Ducky_F01")
        }
        
        let touch = touches.first!
        let point = touch.location(in: self.view)
        
        if point.x > size.width / 2 && point.y < size.width / 2 {
            gunShoooting(1)
//            print("== Duck X position is: \(xTranslation)")
//            print("== Duck Y position is: \(yTranslation)")
//            print("== Gun position is: \(gunShooting.position)")
            if xTranslation == -11 && yTranslation == -9 {
                sprite.removeAllChildren()
                score += 10
                print("DEAD DUCK!!!")
                sprite.removeFromParent()
                
            }
            gun(0)
        }
    }

    func gun(_ number: Int) {
        if number == 1 {
            let gunTexture = SKTexture(imageNamed: "Shoot_F01")
            gunSprite = SKSpriteNode(texture:gunTexture)

            gunSprite.scale(to: CGSize(width: 250, height: 250))
            gunSprite.position = CGPoint(x: 0, y: (view?.frame.midY)! - 320)
            gunSprite.zPosition = -50
            addChild(gunSprite)
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
//            let frame4 = SKTexture(imageNamed: "Shoot_F04")
//            let frame5 = SKTexture(imageNamed: "Shoot_F05")
//            let frame6 = SKTexture(imageNamed: "Shoot_F06")

            let animation = SKAction.animate(with: [gunTexture, frame2, frame3, gunTexture], timePerFrame: 0.2)

            gunShooting.run(animation)

            gunShooting.zPosition = 72

            self.addChild(gunShooting)
        }
    }
}
