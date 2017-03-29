import Foundation
import UIKit

public class Highscore : UIView {
    
    var bg: UIImageView
    
    var back: UILabel
    
    public override init(frame: CGRect) {        
        let font = UIFont(name: "Chalkduster", size: CGFloat(integerLiteral: 20))

        self.bg = UIImageView(image: UIImage(named: "bg")!)
        
        self.back = UILabel(frame: CGRect(x: 10, y: 450, width: 50, height: 20))
        self.back.font = font
        self.back.textColor = UIColor.yellow
        self.back.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.back.text = "←"
        
        super.init(frame: frame)
        
        self.addSubview(bg)
        self.addSubview(back)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
