//
//  PresentationViewController.h
//  demoweb
//
//  Created by Udai Singh Shekhawat on 01/07/2020.
//

#import <UIKit/UIKit.h>
#import "PresentationView.h"

@protocol PresentationViewControllerDelegate;

@interface PresentationViewController : UIViewController <UIWebViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, retain) IBOutlet PresentationView *webView;
@property (nonatomic, assign) id<PresentationViewControllerDelegate>delegate;

- (void)loadURL:(NSString *)url;
- (void)resetPresentationView;
- (NSString *)getKPI;
- (void)clearKPI;

@end


@protocol PresentationViewControllerDelegate <NSObject>

- (void)presentationViewControllerDidFinishLoading:(PresentationViewController *)presentationViewController;
- (void)presentationViewController:(PresentationViewController *)presentationViewController didFailLoadingWithError:(NSError *)error;
- (void)presentationViewControllerOnComplete:(PresentationViewController *)presentationViewController;

@end
