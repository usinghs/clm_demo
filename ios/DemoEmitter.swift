import Foundation

/// DemoEmitter Swift class
class DemoEmitter {

    struct Constants {
        static let openEventName = "sendKPIEvent"
    }
    
    /// Shared Instance.
    static var shared = DemoEmitter()

    // DeeplinkModule is instantiated by React Native with the bridge.
    private static var demoEmitterModule: DemoEmitterModule?
    
    private init() { }
  
    /// All Events which must be support by React Native.
    lazy var allEvents: [String] = {
        var allEventNames: [String] = []
        allEventNames.append(Constants.openEventName)
        
        return allEventNames
    }()
  
    // When React Native instantiates the emitter it is registered here.
    func register(demoEmitterModule: DemoEmitterModule) {
        DemoEmitter.demoEmitterModule = demoEmitterModule
    }
    
    /// Open deeplink
    ///
    /// - Parameter deeplink: navigation target
    func open(deeplink: String) -> Bool {
        if
			let url = URL(string: deeplink),
            let params = url.queryParameters,
            let payload = params["payload"],
            let payloadData = payload.data(using: .utf8),
            let payloadDict = try? JSONSerialization.jsonObject(with: payloadData, options: [])
        {
			if
				let module = DemoEmitter.demoEmitterModule,
				module.bridge != nil
			{
				module.sendEvent(withName: Constants.openEventName, body: payloadDict)
			} else {
				DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
					_ = self.open(deeplink: deeplink)
				})
			}
			return true
        } else {
			return false
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
