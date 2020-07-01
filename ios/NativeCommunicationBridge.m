#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(NativeCommunication, NSObject)

RCT_EXTERN_METHOD(getDataFromRN:(nullable NSString *)value)
RCT_EXTERN_METHOD(getDataFromRN11:(nullable NSString *)value)
RCT_EXTERN_METHOD(sendHTMLPath:(nullable NSString *)htmlpath)

@end



