//
//  StoreDetailViewController.m
//  BRDevTest
//
//  Created by Ravi Alla on 1/13/13.
//  Copyright (c) 2013 Ravi Alla. All rights reserved.
//

#import "StoreDetailViewController.h"

@interface StoreDetailViewController ()

@end

@implementation StoreDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Store Details";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissModalViewControllerAnimated:)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_storeLogo release];
    [_storeName_ID release];
    [_storeAddressLine1 release];
    [_storeAddressLine2 release];
    [_storePhone release];
    [super dealloc];
}
@end
