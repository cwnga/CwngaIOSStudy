//
//  LargestNumber.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 https://leetcode.com/problems/largest-number/
 Given a list of non negative integers, arrange them such that they form the largest number.

 For example, given [3, 30, 34, 5, 9], the largest formed number is 9534330.

 Note: The result may be very large, so you need to return a string instead of an integer.

 Credits:
 Special thanks to @ts for adding this problem and creating all test cases.

 Subscribe to see which companies asked this question
 
 */
@interface LargestNumber : NSObject

-(NSString *)largestNumber:(NSArray *)nums;
@end
