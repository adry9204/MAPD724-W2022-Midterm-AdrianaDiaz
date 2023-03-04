import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 0.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -902)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the horizontal speed: 5 to 10
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomize the vertical speed: -2 to 2
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 2.0) - 1.0
        
        // get a pseudo random number for the X position: -262 to 262
        let randomY:Int = (randomSource?.nextInt(upperBound: 260))! - 130
        position.y = CGFloat(randomY)
        
        // get a pseudo random number for the Y position: 902 to 922
        let randomX:Int = (randomSource?.nextInt(upperBound: 20))! + 902
        position.x = CGFloat(randomX)
        
        isColliding = false
        print(horizontalSpeed)
        print(verticalSpeed)
        print("*******************************")
    }
    
    // public method
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
