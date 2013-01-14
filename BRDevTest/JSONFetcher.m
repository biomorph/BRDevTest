//
//  JSONFetcher.m
//  BRDevTest
//
//  Created by Ravi Alla on 1/11/13.
//  Copyright (c) 2013 Ravi Alla. All rights reserved.
//

#import "JSONFetcher.h"
@implementation JSONFetcher

@synthesize JSONArray = _JSONArray;
+ (NSArray *)getJSONArray
{
    NSString *JSONURLString = [NSString stringWithFormat:@"http://strong-earth-32.heroku.com/stores.aspx"];
    NSString *JSONquery = [JSONURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *JSONData = [NSData dataWithContentsOfURL:[NSURL URLWithString:JSONquery]];
    NSString *JSON_string = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    NSDictionary *JSONDict = [JSON_string JSONValue];
    NSArray *JSONArray = [JSONDict objectForKey:@"stores"];
    [JSON_string release];
    return JSONArray;
}

- (void)dealloc {
    [super dealloc];
}


@end
