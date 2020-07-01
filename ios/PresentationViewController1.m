//
//  PresentationViewController1.m
//  demoweb
//
//  Created by Udai Singh Shekhawat on 01/07/2020.
//

#import "PresentationViewController1.h"

@interface PresentationViewController1 ()

@end

@implementation PresentationViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadURL:(NSString *)url{
  NSLog(@"Get string from Swift class ===%@",url);
//  url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//  [self.webView loadRequest:request];
//  UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 500)];
//  NSString *urlString = @"https://www.google.com";
//  NSURL *newurl = [NSURL URLWithString:urlString];
//  NSURLRequest *request = [NSURLRequest requestWithURL:newurl];
//  [webView loadRequest:request];
//  [self.view addSubview:webView];
  
  UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
  webview.allowsInlineMediaPlayback = YES;
  webview.mediaPlaybackRequiresUserAction = NO;
  NSString *urlString=@"https://www.google.com";
  NSURL *nsurl=[NSURL URLWithString:url];
  NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
  [webview loadRequest:nsrequest];
  [self.view addSubview:webview];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
