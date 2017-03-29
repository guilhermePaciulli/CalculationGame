import Foundation
import SpriteKit

public class GameController : UIView {
    
    var currentView: UIView?
    
    static public var this: GameController?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        GameController.this = self
        changeView(view: MenuView(frame: self.frame))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func changeView(view: UIView) {
        currentView?.removeFromSuperview()
        currentView = view
        self.addSubview(self.currentView!)
    }
}
