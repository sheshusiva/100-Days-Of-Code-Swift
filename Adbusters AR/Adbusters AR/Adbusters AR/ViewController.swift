//
//  ViewController.swift
//  Adbusters AR
//
//  Created by Caleb Wells on 9/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

enum BodyType: Int {
    case bullet = 1
    case target = 2
}

var spawnTimeer = Timer()
var deathTimer = Timer()

class ViewController: UIViewController, ARSCNViewDelegate, SCNPhysicsContactDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var lastContactNode: SCNNode!
    var spriteNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Create sprite
        //createSprite()
        spawnTimeer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(spawnSprite), userInfo: nil, repeats: true)
        deathTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(cleanUp), userInfo: nil, repeats: true)

        
        // Set the scene to the view
        sceneView.scene = scene
        
        self.sceneView.scene.physicsWorld.contactDelegate = self
        
        registerTapRecognizer()
    }
    
    func createSprite() {//(_ scene: SCNScene) {
        let sprite = SCNPlane(width: 0.2, height: 0.1)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "ad")
        sprite.materials = [material]
        
        spriteNode = SCNNode(geometry: sprite)
        spriteNode.name = "target"
        spriteNode.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        spriteNode.physicsBody?.categoryBitMask = BodyType.target.rawValue
        spriteNode.position = SCNVector3(0, 0, -0.6)
        
        self.sceneView.scene.rootNode.addChildNode(spriteNode)
    }
    
    @objc func spawnSprite() {
        createSprite()
    }
    
    private func registerTapRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(shoot))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func shoot(recognizer: UIGestureRecognizer) {
        guard let currentFrame = self.sceneView.session.currentFrame else {
            return
        }
        
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.3
        
        let bullet = SCNSphere(radius: 0.01)
        //let bullet = SCNBox(width: 0.05, height: 0.05, length: 0.05, chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.white
        
        let bulletNode = SCNNode(geometry: bullet)
        bulletNode.name = "bullet"
        bulletNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        bulletNode.physicsBody?.categoryBitMask = BodyType.bullet.rawValue
        bulletNode.physicsBody?.contactTestBitMask = BodyType.target.rawValue
        bulletNode.physicsBody?.isAffectedByGravity = false
        bulletNode.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
        
        let force = SCNVector3(bulletNode.worldFront.x * 2, bulletNode.worldFront.y * 2, bulletNode.worldFront.z * 2)
        
        bulletNode.physicsBody?.applyForce(force, asImpulse: true)
        self.sceneView.scene.rootNode.addChildNode(bulletNode)
    }
    
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        var contactNode: SCNNode
        
        if contact.nodeA.name == "bullet" {
            contactNode = contact.nodeB
        } else {
            contactNode = contact.nodeA
        }
        
        if self.lastContactNode != nil && self.lastContactNode == contactNode {
            return
        }
        
        self.lastContactNode = contactNode
        
        contactNode.removeFromParentNode()
        
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.red
//
//        self.lastContactNode.geometry?.materials = [material]
    }
    
    @objc func cleanUp() {
        for node in self.sceneView.scene.rootNode.childNodes {
            if node.name == "bullet" && node.presentation.position.y > -1 {
                node.removeFromParentNode()
            }
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

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
