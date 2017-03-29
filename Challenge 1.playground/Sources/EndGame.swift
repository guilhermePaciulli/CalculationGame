import Foundation
import UIKit

public class EndGame : UIView {
    
    var bg: UIImageView
    
    var cheering: UILabel
    
    var pointsLabel: UILabel
    
    var backToMainMenu: UILabel
    
    public override init(frame: CGRect) {
        let font20 = UIFont(name: "Chalkduster", size: CGFloat(integerLiteral: 20))
        let font15 = UIFont(name: "Chalkduster", size: CGFloat(integerLiteral: 15))
        
        self.bg = UIImageView(image: UIImage(named: "bg")!)
        
        self.cheering = UILabel(frame: CGRect(x: 0, y: 120, width: 240, height: 30))
        self.cheering.font = font20
        self.cheering.textColor = UIColor.yellow
        self.cheering.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.cheering.textAlignment = NSTextAlignment.center
        self.cheering.numberOfLines = 2
        self.cheering.lineBreakMode = NSLineBreakMode.byClipping
        let best   = "Congratiulations"
        let medium = "Good one!"
        let worst  = "You can do better!"
        let difficulty = MainGame.this?.difficulty
        let points = MainGame.this?.points
    
        self.cheering.text =
            difficulty! == "easy"   ? (points! >  6 ? best  : (points! > 3 ? medium : worst)) :
            difficulty! == "medium" ? (points! >  8 ? best  : (points! > 5 ? medium : worst)) :
                                      (points! > 13 ? best  : (points! > 7 ? medium : worst))
        
        self.pointsLabel = UILabel(frame: CGRect(x: 0, y: 240, width: 240, height: 30))
        self.pointsLabel.font = font15
        self.pointsLabel.textColor = UIColor.yellow
        self.pointsLabel.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.pointsLabel.textAlignment = NSTextAlignment.center
        self.pointsLabel.text = "You made "+String(describing: points!) + " points"
        
        self.backToMainMenu = UILabel(frame: CGRect(x: 70, y: 360, width: 100, height: 30))
        self.backToMainMenu.font = font15
        self.backToMainMenu.textColor = UIColor.yellow
        self.backToMainMenu.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.backToMainMenu.textAlignment = NSTextAlignment.center
        self.backToMainMenu.text = "Main menu"
        
        super.init(frame: frame)
        
        self.addSubview(bg)
        self.addSubview(cheering)
        self.addSubview(pointsLabel)
        self.addSubview(backToMainMenu)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let loc = touches.first?.location(in: self)
        
        if(backToMainMenu.frame.contains(loc!)) {
            GameController.this?.changeView(view: MenuView(frame: self.frame))
        }
    }
}
