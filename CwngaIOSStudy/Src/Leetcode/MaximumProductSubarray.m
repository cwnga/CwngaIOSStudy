//
//  MaximumProductSubarray.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/4/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "MaximumProductSubarray.h"

@implementation MaximumProductSubarray
- (NSInteger)maxProduct:(NSArray *)nums
{
    NSInteger result = 0;

    if (!nums || nums.count == 0) {
        return result;
    }
    NSMutableArray *dp = [NSMutableArray array];
    dp[0] = @{
              @"min": nums[0],
              @"max": nums[0],
              };
    for (NSInteger i = 1; i < nums.count; i++) {

        NSInteger tmp1 = [dp[i-1][@"min"] integerValue] * [nums[i] integerValue];
        NSInteger tmp2 = [dp[i-1][@"max"] integerValue] * [nums[i] integerValue];
        NSInteger min = MIN(MIN(tmp1, tmp2), [nums[i] integerValue]); //最小和自己比一次
        NSInteger max = MAX(MAX(tmp1, tmp2), [nums[i] integerValue]); //最大和自己比一次
        dp[i] = @{@"min":@(min),
                  @"max":@(max),
                  };


    }
    result = [dp[0][@"max"] integerValue];
    for (NSInteger i = 0; i < dp.count; i++) {
        result = MAX(result, [dp[i][@"max"] integerValue]);
    }

    return result;

}
@end
