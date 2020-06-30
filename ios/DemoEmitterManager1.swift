import Foundation

public class DemoEmitterManager1 {
    
    struct Constants {
        static let urlHostName = "sendKPIEvent"
    }
    
    
    @objc public static func open(demoValue: String) -> Bool {

        print("Open",demoValue as Any)
//        guard url.host == Constants.urlHostName else {
//            return false
//        }
        
        //let deeplink = url.absoluteString
        DemoEmitter1.shared.open(demoValue: demoValue)
        
        return true
    }
}
