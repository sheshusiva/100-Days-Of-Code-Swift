//
//  gun.swift
//  Game AR
//
//  Created by Caleb Wells on 9/6/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

class Gun: SKSpriteNode {
    
    var gunSprite: SKSpriteNode = SKSpriteNode()
    var isSetUp = false
    
    func setUp() {
        let gunTexture = SKTexture(imageNamed: "Gun_Scope")
        gunSprite = SKSpriteNode(texture:gunTexture)
        
        gunSprite.scale(to: CGSize(width: 100, height: 100))
        gunSprite.position = CGPoint(x: 0, y: 0)
        addChild(gunSprite)
        
        gunSprite.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        gunSprite.physicsBody?.isDynamic = false
        gunSprite.physicsBody?.affectedByGravity = false
        gunSprite.physicsBody?.allowsRotation = false
        
        gunSprite.physicsBody?.categoryBitMask = BodyType.gun.rawValue
        gunSprite.physicsBody?.collisionBitMask = BodyType.target.rawValue
        gunSprite.physicsBody?.contactTestBitMask = BodyType.target.rawValue
        
        isSetUp = true
    }
    
    func update() {
        if isSetUp == false {
            print("Gun Sprite not set up.")
            return
        }
    }
}
