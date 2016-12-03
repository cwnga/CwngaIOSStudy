//
//  LargestNumber.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "LargestNumber.h"
/*
 https://leetcode.com/problems/largest-number/
 Given a list of non negative integers, arrange them such that they form the largest number.

 For example, given [3, 30, 34, 5, 9], the largest formed number is 9534330.

 Note: The result may be very large, so you need to return a string instead of an integer.

 Credits:
 Special thanks to @ts for adding this problem and creating all test cases.

 Subscribe to see which companies asked this question

 */
@implementation LargestNumber
-(NSString *)largestNumber:(NSArray *)nums
{
    nums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        NSString *string1 = [NSString stringWithFormat:@"%ld%ld", (long)[obj1 integerValue], (long)[obj2 integerValue]];
        NSString *string2 = [NSString stringWithFormat:@"%ld%ld", (long)[obj2 integerValue], (long)[obj1 integerValue]];
        if ([string1 integerValue] < [string2 integerValue]) {
            return NSOrderedDescending;
        } else if ([string1 integerValue] > [string2 integerValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }

    }];

    return [nums componentsJoinedByString:@""];
    
}
@end
