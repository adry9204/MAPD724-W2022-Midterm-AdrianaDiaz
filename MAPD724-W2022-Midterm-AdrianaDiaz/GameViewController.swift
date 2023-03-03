import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
   
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
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
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
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
    
    /*
    func presentStartScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        setScene(sceneName: "StartScene")
    }
    
    
    func presentEndScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        RestartButton.isHidden = false
        EndLabel.isHidden = false
        setScene(sceneName: "EndScene")
    }
     */
}
