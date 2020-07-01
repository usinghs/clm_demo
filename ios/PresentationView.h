//
//  PresentationView.h
//  demoweb
//
//  Created by Udai Singh Shekhawat on 01/07/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PresentationView : UIWebView

- (void)scaleForIPhone;
- (NSString *)getKPI;
- (void)clearKPI;

@end

NS_ASSUME_NONNULL_END
