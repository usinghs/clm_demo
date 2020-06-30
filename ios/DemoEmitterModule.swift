import Foundation

/// DemoEmitterModule Swift class
@objc(DemoEmitterModule)
public class DemoEmitterModuleRename: RCTEventEmitter {
    
    override init() {
        super.init()
        DemoEmitter.shared.register(demoEmitterModule: self)
    }
    
    /// Base overide for RCTEventEmitter.
    ///
    /// - Returns: all supported events
    @objc public override func supportedEvents() -> [String] {
        return DemoEmitter.shared.allEvents
    }
    
    /// Indicates if module needs setup in main thread
    ///
    /// - Returns: Bool value
    @objc public override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
