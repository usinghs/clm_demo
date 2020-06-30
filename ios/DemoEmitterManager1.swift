import Foundation

public class DemoEmitterManager1 {
    
    struct Constants {
        static let urlHostName = "sendKPIEvent"
    }
    
    
    @objc public static func sendDataToRN(demoValue: String) -> Bool {

        print("Open sendDataToRN Manager",demoValue as Any)
//        guard url.host == Constants.urlHostName else {
//            return false
//        }
        
        //let deeplink = url.absoluteString
        DemoEmitter1.shared.sendDataToRN(demoValue: demoValue)
        
        return true
    }
}
