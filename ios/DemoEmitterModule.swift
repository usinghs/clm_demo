import Foundation

/// DemoEmitterModule Swift class
@objc(DemoEmitterModule)
public class DemoEmitterModule: RCTEventEmitter {
    
    override init() {
        super.init()
        DeeplinkEmitter.shared.register(demoEmitterModule: self)
    }
    
    /// Base overide for RCTEventEmitter.
    ///
    /// - Returns: all supported events
    @objc public override func supportedEvents() -> [String] {
        return DeeplinkEmitter.shared.allEvents
    }
    
    /// Indicates if module needs setup in main thread
    ///
    /// - Returns: Bool value
    @objc public override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
