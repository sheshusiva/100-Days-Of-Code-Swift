//
//  Scene.swift
//  AR Game Test
//
//  Created by Caleb Wells on 10/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

enum GameState {
    case home
    case playing
    case gameOver
}

class Scene: SKScene {
    
    var playButton: SKSpriteNode!
    var replayButton: SKSpriteNode!
    var homeButton: SKSpriteNode!
    
    var gameState = GameState.home
    
    var temp = 0
    
    func tempUpdate() {
        temp += 1
        if temp == 100 {
            replayButton.alpha = 1
            homeButton.alpha = 1
            gameState = .gameOver
        }
    }
    
    override func didMove(to view: SKView) {
        createMenus()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if gameState == .playing {
            tempUpdate()
        }
    }
    
    //MARK: ==== Create the menus
    
    func createMenus() {
        playButton = SKSpriteNode(imageNamed: "play")
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        playButton.size = CGSize(width: 100, height: 100)
        addChild(playButton)
        
        replayButton = SKSpriteNode(imageNamed: "replay")
        replayButton.position = CGPoint(x: frame.midX - 200, y: frame.midY)
        replayButton.size = CGSize(width: 100, height: 100)
        replayButton.alpha = 0
        addChild(replayButton)
        
        homeButton = SKSpriteNode(imageNamed: "replay")
        homeButton.position = CGPoint(x: frame.midX + 200, y: frame.midY)
        homeButton.size = CGSize(width: 100, height: 100)
        homeButton.alpha = 0
        addChild(homeButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        switch gameState {
        case .home:
            gameState = .playing
            let fadeOut = SKAction.fadeOut(withDuration: 0.5)
            let remove = SKAction.removeFromParent()
            let wait = SKAction.wait(forDuration: 0.5)
            let sequence = SKAction.sequence([fadeOut, wait, remove])
            playButton.run(sequence)
        case .playing:
            print("playing!")
        case .gameOver:
            let scene = Scene(fileNamed: "Scene")!
            let transition = SKTransition.crossFade(withDuration: 1)
            self.view?.presentScene(scene, transition: transition)
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
