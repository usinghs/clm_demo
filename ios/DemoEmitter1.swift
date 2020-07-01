import Foundation

/// DemoEmitter Swift class
class DemoEmitter1 {

    struct Constants {
        static let openEventName = "sendKPIEvent"
    }
    
    /// Shared Instance.
    static var shared = DemoEmitter1()

    // DeeplinkModule is instantiated by React Native with the bridge.
    private static var demoEmitterModule: DemoEmitterModule1?
    
    private init() { }
  
    /// All Events which must be support by React Native.
    lazy var allEvents: [String] = {
        var allEventNames: [String] = []
        allEventNames.append(Constants.openEventName)
        
        return allEventNames
    }()
  
    // When React Native instantiates the emitter it is registered here.
    func register(demoEmitterModule: DemoEmitterModule1) {
        DemoEmitter1.demoEmitterModule = demoEmitterModule
    }
    
    /// Open deeplink
    ///
    /// - Parameter deeplink: navigation target
    func sendDataToRN(dataToRN: String) {
        print("Open sendDataToRN Emitter",dataToRN as Any)
      
      if let module = DemoEmitter1.demoEmitterModule,
        module.bridge != nil
      {
        module.sendEvent(withName: Constants.openEventName, body: dataToRN)
      } else {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
          _ = self.sendDataToRN(dataToRN: dataToRN)
        })
      }
  }

}

    extension URL {
    
    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
}
