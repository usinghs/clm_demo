import Foundation

/// DemoEmitterManager Swift class
@objc(DemoEmitterModule)
public class DemoEmitterManager {
    
    struct Constants {
        static let urlHostName = "sendKPIEvent"
    }
    
    
    @objc public static func open(deeplink url: URL) -> Bool {

        print("Open",deeplink as Any)
        guard url.host == Constants.urlHostName else {
            return false
        }
        
        let deeplink = url.absoluteString
        DemoEmitter.shared.open(deeplink: deeplink)
        
        return true
    }
}
