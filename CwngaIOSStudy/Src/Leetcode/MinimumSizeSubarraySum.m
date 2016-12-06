//
//  MinimumSizeSubarraySum.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "MinimumSizeSubarraySum.h"

@implementation MinimumSizeSubarraySum
- (NSInteger)minSubArrayLen:(NSInteger)s nums:(NSArray *)nums
{
    NSInteger result = 0;
    if (!nums || nums.count == 0) {
        return result;
    }

    NSInteger sum = 0;
    NSInteger start = 0;

    for (NSInteger i = 0; i < nums.count; i++) {
        sum += [nums[i] integerValue];
        while (start < i && sum - [nums[start] integerValue] >= s) {
            sum -= [nums[start] integerValue];
            start++;
        }
        if (sum >= s && ( i - start + 1 < result || result == 0)) {

            result =  i - start + 1 ;
        }


    }


    return result;
}
@end
