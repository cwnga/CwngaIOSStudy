//
//  ContainsDuplicateIII.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "ContainsDuplicateIII.h"

/*
 https://leetcode.com/problems/contains-duplicate-iii/
 Given an array of integers, find out whether there are two distinct indices i and j in the array such that the difference between nums[i] and nums[j] is at most t and the difference between i and j is at most k.

*/
@implementation ContainsDuplicateIII

- (BOOL)containsNearbyAlmostDuplicate:(NSArray *)nums k:(NSInteger)k t:(NSInteger)t
{
    // i - j < k
    // nums[i] - nums[j] < t

    if (!nums || [nums count] < 2) {
        return NO;

    }
    for (NSInteger i = 0; i < nums.count; i++) {

        for (NSInteger j = i + 1; labs(j - i) <= k && j < nums.count; j++) {
             if (labs([nums[i] integerValue] - [nums[j] integerValue]) <= t) {
                return YES;
            }
        }
        
    }
    return NO;
}

- (BOOL)containsNearbyAlmostDuplicateImprove:(NSArray *)nums k:(NSInteger)k t:(NSInteger)t
{
    NSMutableArray *sortIndexByValue = [NSMutableArray array];
    [nums enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        sortIndexByValue[idx] = @(idx);
    }];
    [sortIndexByValue sortUsingComparator:^NSComparisonResult(NSNumber  *obj1, NSNumber *obj2) {
        if (nums[[obj1 integerValue]] < nums[[obj2 integerValue]]) {
            return NSOrderedAscending  ;
        } else if (nums[[obj1 integerValue]] > nums[[obj2 integerValue]]) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    for (NSInteger i = 0; i < nums.count; i++) {
        NSInteger x = [sortIndexByValue[i] integerValue];
        for (NSInteger j = i + 1; j < nums.count; i++) {
            NSInteger y = [sortIndexByValue[j] integerValue];
            NSInteger diff = labs([nums[y] integerValue] - [nums[x] integerValue]);
            NSInteger di = labs(x-y);
            if (diff > t) {
                break;
            }
            if (di <= k)  {
                return YES;
            }
        }

    }

    return NO;
}

@end
