//
//  GameViewController.swift
//  FPS AR
//
//  Created by Caleb Wells on 9/26/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import ARKit
import GameKit

let leaderboardID = "bestDuckyHuntARScore"

class GameViewController: UIViewController, GKGameCenterControllerDelegate {
    
    var sceneView: ARSKView!

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateWithGameCenter()
        
        if let view = self.view as? ARSKView {
            sceneView = view
            sceneView!.delegate = self
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .resizeFill
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            view.presentScene(scene)
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscapeRight
        } else {
            return .all
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: === Game Center code
    
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
        let touch = touches.first!
        let point = touch.location(in: self.view)
        
        if point.x < view.bounds.width / 2 && point.y > view.bounds.width / 2 {
            submitScoreToGC()
            openGameCenter()
            print("==== Game Center button")
        }
    }
}

// MARK: === Respond to session events
extension GameViewController: ARSKViewDelegate {
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
//        let target = SKSpriteNode(imageNamed: "Ducky_F01")
//        target.name = "target"
//        return target
        if Helper.setupState == .addTarget {
            let sprite: Targets = Targets() //imageNamed: "Ducky_F01"
            sprite.setUpSprites("Ducky_F01")
            return sprite
        } else {
            let someNode: SKNode = SKNode()
            return someNode
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        print("Session failed")
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        print("Session was interrupted")
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        print("Session resumed")
        sceneView.session.run(session.configuration!, options: [.resetTracking, .removeExistingAnchors])
    }
}
