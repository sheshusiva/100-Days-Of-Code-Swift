//
//  ViewController.swift
//  New AR Game Test
//
//  Created by Caleb Wells on 9/9/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit
import GameKit

// Add your own Leaderboard ID below
let leaderboardID = "bestDuckyHuntARScore"

class ViewController: UIViewController, ARSKViewDelegate, GKGameCenterControllerDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    var best = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateWithGameCenter()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        let scene = Scene(size: sceneView.bounds.size)
        scene.scaleMode = .resizeFill
        sceneView.presentScene(scene)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        //configuration.planeDetection = .horizontal
        
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
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        let nodeTexture = SKTexture(imageNamed: "Ducky_F01")
        let node = SKSpriteNode(texture: nodeTexture)
        node.scale(to: CGSize(width: 50, height: 50))
        node.name = "duck"
        
        let fly: SKAction = SKAction.move(by: CGVector(dx: 120000, dy: 80000), duration: 3.5)
        
        let repeatForever: SKAction = SKAction.repeatForever(fly)
        
        node.run(repeatForever)
        
        let frame2 = SKTexture(imageNamed: "Ducky_F02")
        let frame3 = SKTexture(imageNamed: "Ducky_F03")
        let frame4 = SKTexture(imageNamed: "Ducky_F04")
        
        let animation = SKAction.animate(with: [nodeTexture, frame2, frame3, frame4], timePerFrame: 0.12)
        let runForever = SKAction.repeatForever(animation)
        
        node.run(runForever)
        
        return node
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
    
    // ==== MARK: - Game Center code
    
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
        if score > best {
            score = best
        }
        
        let bestScore = UserDefaults.standard
        bestScore.set(best, forKey: "best")
        
        // Submit score to Game Center
        let gcbestScore = GKScore(leaderboardIdentifier: leaderboardID)
        gcbestScore.value = Int64(bestScore.value(forKey: "best"))
        GKScore.report([gcbestScore]) { (error) in
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
        let touch = touches.first!
        let point = touch.location(in: self.view)
        
        if point.x < view.bounds.width / 2 && point.y > view.bounds.width / 2 {
            submitScoreToGC()
            openGameCenter()
            print("Game Center button")
            print("==== The best score is: \()")
        }
    }
}
