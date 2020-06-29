//
//  NativeCommunicationBridge.m
//  demoweb
//
//  Created by Rajesh Kumar M on 24/06/2020.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(NativeCommunication, NSObject)

RCT_EXTERN_METHOD(sendHTMLPath:(nullable NSString *)htmlpath)

@end



