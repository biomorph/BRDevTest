//
//  JSONFetcher.h
//  BRDevTest
//
//  Created by Ravi Alla on 1/11/13.
//  Copyright (c) 2013 Ravi Alla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

@interface JSONFetcher : NSObject

@property (nonatomic,strong) NSArray *JSONArray;
+ (NSArray *)getJSONArray;
@end
