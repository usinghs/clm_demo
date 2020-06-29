import Foundation

/// DemoEmitterManager Swift class
public class DemoEmitterManager {
    
    struct Constants {
        static let urlHostName = "sendKPIEvent"
    }
    
    /// Open deeplink url
    ///
    /// - Parameter url: deeplink
    /// - Returns: deeplinking succeeded
    public static func open(deeplink url: URL) -> Bool {
        guard url.host == Constants.urlHostName else {
            return false
        }
        
        let deeplink = url.absoluteString
        DemoEmitter.shared.open(deeplink: deeplink)
        
        return true
    }
}
