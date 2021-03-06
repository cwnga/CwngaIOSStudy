//
//  MinimumSizeSubarraySum.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 https://leetcode.com/problems/minimum-size-subarray-sum/
 Given an array of n positive integers and a positive integer s, find the minimal length of a subarray of which the sum ≥ s. If there isn't one, return 0 instead.

 For example, given the array [2,3,1,2,4,3] and s = 7,
 the subarray [4,3] has the minimal length under the problem constraint.

 */
@interface MinimumSizeSubarraySum : NSObject
- (NSInteger)minSubArrayLen:(NSInteger)s nums:(NSArray *)nums;

@end
