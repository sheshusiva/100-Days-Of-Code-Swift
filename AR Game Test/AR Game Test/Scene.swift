//
//  Scene.swift
//  AR Game Test
//
//  Created by Caleb Wells on 10/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

var score = 0

enum GameState {
    case home
    case playing
}

class Scene: SKScene {
    
    var playButton: SKSpriteNode!
    var gcButton: SKSpriteNode!
    
    var gameState = GameState.home
    
    var anchorCount = 0
    
    override func didMove(to view: SKView) {
        createMenu()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if gameState == .playing {
            anchorCount += 1
            
            if gameState == .playing && anchorCount == 20 {
                createAnchor()
                anchorCount = 0
            }
        }
    }
    
    //MARK: ==== Create the menus
    func createMenu() {
        playButton = SKSpriteNode(imageNamed: "play")
        playButton.position = CGPoint(x: frame.midX + 200, y: frame.midY)
        playButton.size = CGSize(width: 100, height: 100)
        addChild(playButton)
        
        gcButton = SKSpriteNode(imageNamed: "gc")
        gcButton.position = CGPoint(x: frame.midX - 200, y: frame.midY)
        gcButton.size = CGSize(width: 100, height: 100)
        addChild(gcButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: self.view)
        
        switch gameState {
        case .home:
            if point.x > (view?.frame.width)! / 2 {
                gameState = .playing
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let remove = SKAction.removeFromParent()
                let wait = SKAction.wait(forDuration: 0.5)
                let sequence = SKAction.sequence([fadeOut, wait, remove])
                playButton.run(sequence)
                gcButton.run(sequence)
            }
        case .playing:
            goHome()
        }
    }
    
    func goHome() {
        let gameOverLabel = SKLabelNode(text: "Game Over")
        addChild(gameOverLabel)
        
        let fadeIn = SKAction.fadeIn(withDuration: 1.5)
        let remove = SKAction.removeFromParent()
        let wait = SKAction.wait(forDuration: 1)
        let gameOverSequence = SKAction.sequence([fadeIn, wait, remove])
        gameOverLabel.run(gameOverSequence)
        
        let transitioWait = SKAction.wait(forDuration: 1)
        let action = SKAction.run {
            let scene = Scene(fileNamed: "Scene")!
            let transition = SKTransition.moveIn(with: .up, duration: 0.1)
            self.view?.presentScene(scene, transition: transition)
        }
        self.run(SKAction.sequence([transitioWait, action]))
    }
    
    func createAnchor() {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            
            // Create a transform with a translation of 0.2 meters in front of the camera
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -0.2
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
        }
    }
}