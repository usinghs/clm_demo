#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

/// DemoEmitterModule Obj-C bridge
@interface RCT_EXTERN_MODULE(DemoEmitterModule, RCTEventEmitter)

RCT_EXTERN_METHOD(supportedEvents)

@end
