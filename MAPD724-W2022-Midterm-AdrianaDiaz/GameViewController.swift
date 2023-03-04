// Landscape Mail Pilot
// Created by Adriana Diaz Torres
// Student ID: 301157161
// Date: 2/03/2023
// Version: 1.0
// Description: This game uses SpriteKit to handle the animation and visual components of the app. It is coded to be presented only in landscape mode. It comprises two Sprite Scenes, one for the game and another for the game over scenario, allowing the user to go back to the game with just one button. The labels, as well as the button are integrated using the Storyboard and are simple UI components


import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
   
    //labels of the Game Scene
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    //Label and Button of the EndScene
    @IBOutlet weak var RestartButton: UIButton!
    @IBOutlet weak var GameOverLabel: UILabel!
    
    // Instance Variables
    var currentScene: GKScene?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setScene(sceneName: "GameScene")
        CollisionManager.gameViewController = self
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return .landscape
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //used to update the UI when the amount of lives changes
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    //used to update the UI when the score changes
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    //used to move from the GameScene to the EndScene and backwards
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    //enables the correct UI components in the EndScene while hidig the unnecesary ones
    //it invoques the setScene method to load the correct SpriteKit Scene
    func presentEndScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        RestartButton.isHidden = false
        GameOverLabel.isHidden = false
        setScene(sceneName: "EndScene")
    }
    
    //enables the correct UI components in the GameScene while hidig the unnecesary ones
    //it invoques the setScene method to load the correct SpriteKit Scene
    //resets the status of the game using the Score Manager
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        RestartButton.isHidden = true
        GameOverLabel.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
        
    }
}
