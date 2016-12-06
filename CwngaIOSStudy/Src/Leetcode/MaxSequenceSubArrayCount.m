//
//  MaxSequenceSubArrayCount.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "MaxSequenceSubArrayCount.h"

@implementation MaxSequenceSubArrayCount
- (NSInteger)maxSequenceSubArrayCount:(NSArray *)nums
{
    NSInteger maxCount = 0;
    NSInteger currentMaxCount = 0;
    if (nums.count >= 1) {
        maxCount = 1;
        currentMaxCount = 1;
    }
    for (NSInteger i = 1; i < nums.count; i++) {
        if ([nums[i] integerValue] > [nums[i-1] integerValue]) {
            currentMaxCount++;
            maxCount = MAX(maxCount, currentMaxCount);
        } else {
            currentMaxCount = 1;
        }

    }

    return maxCount;


}
@end
