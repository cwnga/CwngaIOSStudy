//
//  MaximumProductSubarray.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/4/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//
/*
 Maximum Product Subarray
 https://leetcode.com/problems/maximum-product-subarray/

 Find the contiguous subarray within an array (containing at least one number) which has the largest product.

 For example, given the array [2,3,-2,4],
 the contiguous subarray [2,3] has the largest product = 6.

 Subscribe to see which companies asked this question
 */
#import <Foundation/Foundation.h>

@interface MaximumProductSubarray : NSObject
- (NSInteger)maxProduct:(NSArray *)nums;

@end
