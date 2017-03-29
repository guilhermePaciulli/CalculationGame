import Foundation
import SpriteKit

public class MenuView : UIView {
    
    var bg: UIImageView
    
    var title: UIImageView
    
    var play: UILabel
    
    var info: UILabel
    
    public override init(frame: CGRect) {
        let font = UIFont(name: "Chalkduster", size: CGFloat(integerLiteral: 20))
        
        self.bg = UIImageView(image: UIImage(named: "bg")!)
        
        self.title = UIImageView(image: UIImage(named: "title")!)
        
        self.play = UILabel(frame: CGRect(x: 90, y: 230, width: 60, height: 40))
        self.play.font = font
        self.play.textColor = UIColor.yellow
        self.play.backgroundColor = UIColor.white.withAlphaComponent(0)
        play.text = "Play"
        
        self.info = UILabel(frame: CGRect(x: 90, y: 290, width: 100, height: 40))
        self.info.font = font
        self.info.textColor = UIColor.yellow
        self.info.backgroundColor = UIColor.white.withAlphaComponent(0)
        info.text = "Highscore"

        super.init(frame: frame)
        
        self.addSubview(bg)
        self.addSubview(title)
        self.addSubview(play)
        self.addSubview(info)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let loc = touches.first?.location(in: self)

        if(play.frame.contains(loc!)) {
            GameController.this?.changeView(view: DifficultySelection(frame: self.frame))
        }
        
        if(info.frame.contains(loc!)) {
            print("Info")
        }
    }
    
}
