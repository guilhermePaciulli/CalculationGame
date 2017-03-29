import Foundation


public class RoundVO {
    
    public var numbers: [String] = []
    
    var firstNumber: Int?
    
    var secondNumber: Int?
    
    var operation: String?
    
    public var right: String?
    
    public init(difficulty: String) {
        var max: Int
        
        switch difficulty {
        case "easy":
            max = 10
        case "medium":
            max = 20
        case "hard":
            max = 30
        default:
            max = 0
        }
        
        self.firstNumber = Int(arc4random_uniform(UInt32(max)))
        self.secondNumber = Int(arc4random_uniform(UInt32(max)))
        
        let o = Int(arc4random_uniform(UInt32(3)))
        
        if(o == 1) {
            self.operation = " + "
            numbers.append(String(describing: firstNumber! + secondNumber!))
            self.right = numbers.last
        } else if(o == 2) {
            self.operation = " - "
            numbers.append(String(describing: firstNumber! - secondNumber!))
            self.right = numbers.last
        } else {
            self.operation = " * "
            numbers.append(String(describing: firstNumber! * secondNumber!))
            self.right = numbers.last
        }
        generateNumbers()
        numbers.shuffle()
    }
    
    public func random() -> Int {
        var p = Int(arc4random_uniform(UInt32(7)))
        p = p > 3 ? (p - 3) * -1 : p
        return p
    }
    
    public func generateNumbers() {
        var count = 5
        while(count >= 0) {
            if(numbers.count == 6) {
                break
            }
            let newNumber = Int(self.right!)! + random()
            if (numbers.index(of: String(describing: newNumber)) == nil) {
                self.numbers.append(String(describing: newNumber))
                count -= 1
            }
        }
    }
    
    public func getFormatedStr() -> String {
        return String(describing: firstNumber!) + self.operation! + String(describing: secondNumber!)
    }
    

}
