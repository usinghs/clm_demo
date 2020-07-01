//
//  PresentationView.m
//  demoweb
//
//  Created by Udai Singh Shekhawat on 01/07/2020.
//

#import "PresentationView.h"

static CGFloat const IPHONE_SCALE = 0.425;

@implementation PresentationView

- (NSString *)executeMethodWithName:(NSString *)methodName
{
  return [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"executeMethod('%@');", methodName]];
}

- (NSString *)invokeEventWithName:(NSString *)eventName
{
  return [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"invokeEvent('%@');", eventName]];
}

- (NSString *)getKPI
{
    return [self executeMethodWithName:@"getKPI"];
}

- (void)clearKPI
{
    [self executeMethodWithName:@"clearStorage"];
}

- (void)scaleForIPhone
{
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.body.style.zoom = %f;", IPHONE_SCALE]];
}

@end
