//
//  StoreDetailViewController.h
//  BRDevTest
//
//  Created by Ravi Alla on 1/13/13.
//  Copyright (c) 2013 Ravi Alla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreDetailViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *storeLogo;

@property (retain, nonatomic) IBOutlet UILabel *storeName_ID;

@property (retain, nonatomic) IBOutlet UILabel *storeAddressLine1;
@property (retain, nonatomic) IBOutlet UILabel *storeAddressLine2;
@property (retain, nonatomic) IBOutlet UILabel *storePhone;

@end
