//
//  ReverseWordsInAString.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//


#import "ReverseWordsInAString.h"

@implementation ReverseWordsInAString
- (NSString *)reverseWords:(NSString *)string
{
    NSPredicate *predicateName = [NSPredicate predicateWithFormat:@"length > 0"];
    NSString *result =  [[[[[string componentsSeparatedByString:@" "] reverseObjectEnumerator] allObjects] filteredArrayUsingPredicate:predicateName] componentsJoinedByString:@" "];
   
    return result;
}
@end
