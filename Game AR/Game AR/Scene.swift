//
//  Scene.swift
//  Game AR
//
//  Created by Caleb Wells on 8/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    var spawn = 0
    var xTranslation = -5
    var zTranslation = -9
    
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
            translation.columns.3.x = Float(xTranslation)
            translation.columns.3.y = -7
            translation.columns.3.z = Float(zTranslation)
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
        }
    }
    
    func spawnTimes() {
        if spawn == 200 {
            CreateSprite()
            spawn = 0
        }
    }
    
    override func didMove(to view: SKView) {
        // Setup your scene here
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        spawn += 1
        spawnTimes()
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        // Called when touched
//        
//    }
}
