//
//  ViewController.swift
//  AR Shooter??
//
//  Created by Caleb Wells on 9/8/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

enum BodyType: UInt32 {
    case gun = 1
    case duck = 2
}

class ViewController: UIViewController, ARSKViewDelegate, SKPhysicsContactDelegate {
    
    let duckSprite = SKSpriteNode(imageNamed: "Ducky_F01")
    let gunSprite = SKSpriteNode(imageNamed: "Shoot_F01")
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.scene?.physicsWorld.contactDelegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        sceneView.showsFields = true
        sceneView.showsPhysics = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
        
        // Add duck sprite
        duckSprite.scale(to: CGSize(width: 80, height: 80))
        //duckSprite.position = CGPoint(x: 0, y: 0)
        duckSprite.physicsBody = SKPhysicsBody(circleOfRadius: 80)
        duckSprite.physicsBody?.isDynamic = false
        duckSprite.physicsBody?.affectedByGravity = true
        duckSprite.physicsBody?.allowsRotation = false
        //
//        duckSprite.physicsBody?.categoryBitMask = BodyType.duck.rawValue
//        duckSprite.physicsBody?.collisionBitMask = BodyType.gun.rawValue
//        duckSprite.physicsBody?.contactTestBitMask = BodyType.gun.rawValue
        
        let moveDuckUpAction = SKAction.moveTo(y: 50, duration: 2)
        let moveDuckDownAction = SKAction.moveTo(y: -50, duration: 2)
        let groupAction = SKAction.group([moveDuckUpAction, moveDuckDownAction])
        duckSprite.run(groupAction)
        duckSprite.zPosition = -72
        sceneView.scene!.addChild(duckSprite)
        
        // Add gun sprite
        gunSprite.scale(to: CGSize(width: 200, height: 200))
        gunSprite.position = CGPoint(x: 0, y: -120)
        gunSprite.physicsBody = SKPhysicsBody(circleOfRadius: 80)
        gunSprite.physicsBody?.isDynamic = false
        gunSprite.physicsBody?.affectedByGravity = false
        gunSprite.physicsBody?.allowsRotation = false
        //
//        gunSprite.physicsBody?.categoryBitMask = BodyType.gun.rawValue
//        gunSprite.physicsBody?.collisionBitMask = BodyType.duck.rawValue
//        gunSprite.physicsBody?.contactTestBitMask = BodyType.duck.rawValue
        sceneView.scene!.addChild(gunSprite)
        
        self.sceneView.scene?.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("hello did b")
        if contact.bodyA.categoryBitMask == BodyType.duck.rawValue && contact.bodyB.categoryBitMask == BodyType.gun.rawValue {
            duckSprite.removeFromParent()
            print("==== Did began contact??")
        } else if contact.bodyB.categoryBitMask == BodyType.duck.rawValue && contact.bodyA.categoryBitMask == BodyType.gun.rawValue {
            duckSprite.removeFromParent()
            print("==== Did began contact??")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        return duckSprite
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        duckSprite.physicsBody?.categoryBitMask = BodyType.duck.rawValue
        duckSprite.physicsBody?.collisionBitMask = BodyType.gun.rawValue
        duckSprite.physicsBody?.contactTestBitMask = BodyType.gun.rawValue
        
        gunSprite.physicsBody?.categoryBitMask = BodyType.gun.rawValue
        gunSprite.physicsBody?.collisionBitMask = BodyType.duck.rawValue
        gunSprite.physicsBody?.contactTestBitMask = BodyType.duck.rawValue
        
        print("Hello touch?")
        
//        for duckSprites in (sceneView.scene?.children)! {
//            if duckSprites.name == "Ducky_F01" {
//                print("=======================")
//                if duckSprites is SKSpriteNode {
//                    duckSprites.physicsBody?.categoryBitMask = BodyType.duck.rawValue
//                    print("==== Found duck!")
//                }
//            }
//        }
    }
}
