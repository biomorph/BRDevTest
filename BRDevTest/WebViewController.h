//
//  WebViewController.h
//  BRDevTest
//
//  Created by Ravi Alla on 1/11/13.
//  Copyright (c) 2013 Ravi Alla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) IBOutlet UIWebView *webview;

@end
