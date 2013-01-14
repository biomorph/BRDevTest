//
//  CustomCell.h
//  BRDevTest
//
//  Created by Ravi Alla on 1/12/13.
//  Copyright (c) 2013 Ravi Alla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *logo;
@property (retain, nonatomic) IBOutlet UILabel *phoneNumber;
@property (retain, nonatomic) IBOutlet UILabel *address;

@end
