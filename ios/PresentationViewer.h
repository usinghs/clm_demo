//
//  PresentationViewer.h
//  demoweb
//
//  Created by Udai Singh Shekhawat on 01/07/2020.
//

#import "Cordova/CDVPlugin.h"
#import "PresentationViewController.h"

@interface PresentationViewer : CDVPlugin <PresentationViewControllerDelegate>

@property (nonatomic, retain) PresentationViewController *presentationViewer;

- (void)openPresentation:(CDVInvokedUrlCommand *)command;
- (void)closePresentation:(CDVInvokedUrlCommand *)command;
- (void)getKPI:(CDVInvokedUrlCommand *)command;

@end  
