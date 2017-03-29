import Foundation
import SpriteKit

public class DifficultySelection : UIView {
    
    var bg: UIImageView
    
    var select: UIImageView
    
    var back: UILabel
    
    var easy: UILabel
    
    var medium: UILabel
    
    var hard: UILabel
    
    
    public override init(frame: CGRect) {
        let font = UIFont(name: "Chalkduster", size: CGFloat(integerLiteral: 20))
        
        self.bg = UIImageView(image: UIImage(named: "bg")!)
        
        self.select = UIImageView(image: UIImage(named: "select")!)
        
        self.easy = UILabel(frame: CGRect(x: 90, y: 230, width: 60, height: 40))
        self.easy.font = font
        self.easy.textColor = UIColor.yellow
        self.easy.backgroundColor = UIColor.white.withAlphaComponent(0)
        easy.text = "Easy"
        
        self.medium = UILabel(frame: CGRect(x: 90, y: 290, width: 150, height: 40))
        self.medium.font = font
        self.medium.textColor = UIColor.yellow
        self.medium.backgroundColor = UIColor.white.withAlphaComponent(0)
        medium.text = "Medium"
        
        self.hard = UILabel(frame: CGRect(x: 90, y: 350, width: 60, height: 40))
        self.hard.font = font
        self.hard.textColor = UIColor.yellow
        self.hard.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.hard.text = "Hard"
        
        self.back = UILabel(frame: CGRect(x: 10, y: 450, width: 50, height: 20))
        self.back.font = font
        self.back.textColor = UIColor.yellow
        self.back.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.back.text = "←"
        
        super.init(frame: frame)
        
        self.addSubview(self.bg)
        self.addSubview(self.select)
        self.addSubview(self.easy)
        self.addSubview(self.medium)
        self.addSubview(self.hard)
        self.addSubview(self.back)        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let loc = touches.first?.location(in: self)
        
        if(easy.frame.contains(loc!)) {
            GameController.this?.changeView(view: MainGame(frame: self.frame, difficulty: "easy"))
        }
        
        if(medium.frame.contains(loc!)) {
            GameController.this?.changeView(view: MainGame(frame: self.frame, difficulty: "medium"))
        }
        
        if(hard.frame.contains(loc!)) {
            GameController.this?.changeView(view: MainGame(frame: self.frame, difficulty: "hard"))
        }
        
        if(back.frame.contains(loc!)) {
            GameController.this?.changeView(view: MenuView(frame: self.frame))
        }
    }
    
}
