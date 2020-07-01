import Foundation

public class DemoEmitterManager1 {
    
    struct Constants {
        static let urlHostName = "sendKPIEvent"
    }
    
    
    @objc public static func sendDataToRN(dataToRN: String) -> Bool {

        print("Open sendDataToRN Manager",dataToRN as Any)
        DemoEmitter1.shared.sendDataToRN(dataToRN: dataToRN)
        
        return true
    }
}
