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
    }
}
