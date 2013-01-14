//
//  WebViewController.m
//  BRDevTest
//
//  Created by Ravi Alla on 1/11/13.
//  Copyright (c) 2013 Ravi Alla. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;

@end

@implementation WebViewController

@synthesize webview = _webview;
@synthesize toolbar = _toolbar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

}
- (IBAction)goback:(id)sender
{
    [self.webview goBack];
}

- (IBAction)goforward:(id)sender
{
    [self.webview goForward];
}

- (IBAction)refreshpage:(id)sender
{
    [self.webview reload];
}

- (IBAction)stop:(id)sender
{
    [self.webview stopLoading];
}
// load Google's mobile transit website when the view is loaded
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.webview.delegate = self;
    
    NSString *UrlString =[NSString stringWithFormat:@"http://www.apple.com"];
    NSURL *URL = [NSURL URLWithString:UrlString];
    [self.webview loadRequest:[NSURLRequest requestWithURL:URL]];
    [self updateButtons];
    
}
- (void) updateButtons
{
    UIBarButtonItem *back = [self.toolbar.items objectAtIndex:0];
    UIBarButtonItem *forward = [self.toolbar.items objectAtIndex:1];
    back.enabled = self.webview.canGoBack;
    forward.enabled=self.webview.canGoForward;
        
}
- (void) webViewDidStartLoad:(UIWebView *)webView
{
    [self updateButtons];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self updateButtons];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self updateButtons];
}
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void) viewDidAppear:(BOOL)animated
{
    [_webview release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
