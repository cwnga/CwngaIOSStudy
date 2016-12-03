//
//  ThreeSum.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "ThreeSum.h"

@implementation ThreeSum


- (NSArray *)threeSum:(NSArray *)nums
{
    NSMutableArray *result = [NSMutableArray array];

    if ([nums count] < 3) {
        return [result copy];
    }
    nums = [nums sortedArrayUsingSelector:@selector(compare:)];

    for (NSInteger i = 0; i < [nums count] - 2; i++) {

        if (i == 0 || [nums[i] integerValue] > [nums[i-1] integerValue]) {
            //nums[i] > nums[i-1] for no need count dup
            //for example:
            //input: [-4, -1, -1, 0, 1, 2]
            //result:[[-1, -1, 2]
            //[-1, 0, 1]
            //[-1, 0, 1]//dep , nums[i] == nums[i-1]]



            NSInteger start = i+1;
            NSInteger end = nums.count - 1;
            while (start < end) {
                NSInteger sum = [nums[i] integerValue] + [nums[start] integerValue] + [nums[end] integerValue];

                if (sum == 0) {
                    NSArray *tmp = @[nums[i],nums[start],nums[end] ];
                    [result addObject:tmp];
                }
                if (sum > 0) {
                    NSInteger currentEnd = end;
                    while (nums[currentEnd] == nums[end]) {
                        end--;
                    }
                } else {
                    NSInteger currentStart = start;
                    while (nums[currentStart] == nums[start]) {
                        start++;
                    }
                }
                
                
            }
        }
    }
    return [result copy];
}
@end
