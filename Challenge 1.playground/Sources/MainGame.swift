import Foundation
import SpriteKit

public class MainGame : UIView {
    
    static var this: MainGame?
    
    let font = UIFont(name: "Chalkduster", size: CGFloat(integerLiteral: 40))

    let font20 = UIFont(name: "Chalkduster", size: CGFloat(integerLiteral: 20))
    
    var bg: UIImageView
    
    var options: OptionsView?
    
    var calculate: UILabel
    
    var roundLabel: UILabel
    
    var pointsLabel: UILabel
    
    var round = 1
    
    var maxRounds: Int?
    
    var roundVO: RoundVO?
    
    var difficulty: String?
    
    var points: Int  = 0
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(frame: CGRect, difficulty: String) {
        self.bg = UIImageView(image: UIImage(named: "bg")!)
        
        self.calculate = UILabel(frame: CGRect(x: 0, y: 150, width: 240, height: 30))
        self.calculate.font = font
        self.calculate.textColor = UIColor.yellow
        self.calculate.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.calculate.textAlignment = NSTextAlignment.center
        
        self.roundLabel = UILabel(frame: CGRect(x: 0, y: 40, width: 240, height: 30))
        self.roundLabel.font = font20
        self.roundLabel.textColor = UIColor.yellow
        self.roundLabel.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.roundLabel.textAlignment = NSTextAlignment.center
        
        self.pointsLabel = UILabel(frame: CGRect(x: 0, y: 5, width: 240, height: 30))
        self.pointsLabel.font = font20
        self.pointsLabel.textColor = UIColor.yellow
        self.pointsLabel.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.pointsLabel.textAlignment = NSTextAlignment.center
        

        super.init(frame: frame)
        
        MainGame.this = self
        
        self.addSubview(bg)
        self.addSubview(calculate)
        self.addSubview(roundLabel)
        self.addSubview(pointsLabel)

        
        setDifficulty(difficulty: difficulty)
        
        setRound()
        
    }
    
    private func setDifficulty(difficulty: String) {
        switch difficulty {
        case "easy":
            self.maxRounds = 7
            self.difficulty = "easy"
        case "medium":
            self.maxRounds = 10
            self.difficulty = "medium"
        case "hard":
            self.maxRounds = 15
            self.difficulty = "hard"
        default:
            self.maxRounds = 0
            self.difficulty = ""
        }
    }
    
    public func nextRound(optionChoosen: String) {
        round += 1
        
        if(roundVO?.right == optionChoosen) {
            points += 1
            blinkScreen(isRed: false)
        } else {
            blinkScreen(isRed: true)
        }
        
        if(self.round > self.maxRounds!) {
            GameController.this?.changeView(view: EndGame(frame: self.frame))
        } else {
            self.setRound()
        }
        
    }
    
    public func blinkScreen(isRed: Bool) {
        let v = UIView(frame: self.frame)
        v.backgroundColor = round <= maxRounds! ? (isRed ? UIColor.red : UIColor.green) : UIColor.yellow
        v.alpha = 1
        v.layer.zPosition = 1
        self.addSubview(v)
        UIView.animate(withDuration: 1, animations: {
            v.alpha = 0.0
        }, completion: {(finished:Bool) in
            v.removeFromSuperview()
        })
    }
    
    public func setRound() {
        if(options != nil) {
            options?.removeFromSuperview()
        }
        
        roundVO = RoundVO(difficulty: self.difficulty!)
        
        self.options = OptionsView(frame: CGRect(x: 20, y: 260, width: 200, height: 200), numbers: (roundVO?.numbers)!)
        
        
        self.calculate.text = roundVO?.getFormatedStr()
        self.roundLabel.text = "Round: " + String(describing: self.round)
        self.pointsLabel.text = "Points: " + String(describing: points)
        
        self.addSubview(options!)
    }
    
}

public class OptionsView : UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init(frame: CGRect, numbers: [String]) {
        super.init(frame: frame)
        for i in 0...5 {
            let o = Option(frame: CGRect(x: (i / 3 <= 0 ? i * (200/3) : (i - 3) * (200/3)),
                                         y: (i / 3 <= 0 ? 0 : 100),
                                         width: 200/3, height: 100))
            o.setUpOption(text: numbers[i])
            self.addSubview(o)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public class Option : UIView {
    
    let font = UIFont(name: "Chalkduster", size: CGFloat(integerLiteral: 20))
    
    var label: UILabel?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpOption(text: String) {
        label = UILabel(frame: CGRect(x: 5, y: 5, width: 200/3 - 5, height: 95))
        label?.font = font
        label?.textColor = UIColor.white
        label?.backgroundColor = UIColor.brown
        label?.text = text
        label?.textAlignment = NSTextAlignment.center
        self.addSubview(self.label!)

    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        MainGame.this?.nextRound(optionChoosen: (label?.text)!)
    }
}
