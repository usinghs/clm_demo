#import "PresentationViewController1.h"
#import "demoweb-Swift.h"

@interface PresentationViewController1 (){
  UIWebView *webview;
}

@end

@implementation PresentationViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
  
  UIButton *sendKPI= [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [sendKPI addTarget:self action:@selector(sendKPIButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
   [sendKPI setFrame:CGRectMake(1200, 600, 200, 100)];
  [sendKPI setTitle:@"Send KPI" forState:UIControlStateNormal];
  [sendKPI setExclusiveTouch:YES];
  [self.view addSubview:sendKPI];
  self.view.userInteractionEnabled = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)loadURL:(NSString *)url{
  NSLog(@"Get URL from Swift class ===%@",url);
  
  webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-200,self.view.frame.size.height-100)];
  webview.allowsInlineMediaPlayback = YES;
  webview.mediaPlaybackRequiresUserAction = NO;
  NSURL *nsurl=[NSURL URLWithString:url];
  NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
  [webview loadRequest:nsrequest];
  [self.view addSubview:webview];
}

-(void) sendKPIButtonClicked:(UIButton*)sender
 {
   NativeCommunication *nativeCommunicationObj = [NativeCommunication new];
   NSString *kpi = [webview stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"executeMethod('%@');", @"getKPI"]];
   NSLog(@"KPI in IOS source layer ===%@",kpi);
   [nativeCommunicationObj sendDataToRN:kpi];
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
