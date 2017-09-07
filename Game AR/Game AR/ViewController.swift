//
//  ViewController.swift
//  Game AR
//
//  Created by Caleb Wells on 8/23/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit
import GameKit

// add your own Leaderboard ID below
let leaderboardID = "bestDuckyHuntARScore"

class ViewController: UIViewController, ARSKViewDelegate, GKGameCenterControllerDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateWithGameCenter()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        sceneView.showsPhysics = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
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
        if Helper.setupState == .addTarget {
            let sprite: Targets = Targets()
            sprite.setUpSprites("Ducky_F01")
            return sprite
        } else {
            let someNode: SKNode = SKNode()
            return someNode
        }
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
    
    // MARK: - Game Center code
    
    var gkEnabled = Bool()
    var gkDefaultLeaderBoardID = String()
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    func authenticateWithGameCenter() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if (ViewController) != nil {
                self.present(ViewController!, animated: true, completion: nil)
            } else if localPlayer.isAuthenticated {
                self.gkEnabled = true
                
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: {(leaderboardID, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        self.gkDefaultLeaderBoardID = leaderboardID!
                    }
                })
            } else {
                self.gkEnabled = false
                print(error!)
            }
        }
    }
    
    func submitScoreToGC() {
        
        // submit score to Game Center
        let bestScore = GKScore(leaderboardIdentifier: leaderboardID)
        bestScore.value = Int64(score)
        GKScore.report([bestScore]) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                // code?
            }
        }
    }
    
    func openGameCenter() {
        let gameCenterVC = GKGameCenterViewController()
        gameCenterVC.gameCenterDelegate = self
        gameCenterVC.viewState = .leaderboards
        gameCenterVC.leaderboardIdentifier = leaderboardID
        present(gameCenterVC, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // MARK: ==== Check what side of the screen got tapped
        let touch = touches.first!
        let point = touch.location(in: self.view)
        
        if point.x < view.bounds.width / 2 && point.y > view.bounds.width / 2 {
            submitScoreToGC()
            openGameCenter()
            print("Game Center button")
        } else {
            // ??
        }
    }
}

