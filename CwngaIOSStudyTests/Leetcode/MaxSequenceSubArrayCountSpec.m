//
//  MaxSequenceSubArrayCountSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Kiwi/Kiwi.h>
#import "MaxSequenceSubArrayCount.h"

SPEC_BEGIN(MaxSequenceSubArrayCountSpec)

describe(@"test TwoSum", ^{

    it(@"test", ^{
        MaxSequenceSubArrayCount *test = [[MaxSequenceSubArrayCount alloc] init];
        NSInteger max = [test maxSequenceSubArrayCount:@[@(2),@(1),@(2),@(1),@(2),@(9),@(8)]];
        [[theValue(max) should] equal:theValue(3)];
    });
    it(@"test", ^{
        MaxSequenceSubArrayCount *test = [[MaxSequenceSubArrayCount alloc] init];
        NSInteger max = [test maxSequenceSubArrayCount:@[@(2),@(1)]];
        [[theValue(max) should] equal:theValue(1)];
    });

    it(@"test", ^{
        MaxSequenceSubArrayCount *test = [[MaxSequenceSubArrayCount alloc] init];
        NSInteger max = [test maxSequenceSubArrayCount:@[@(1)]];
        [[theValue(max) should] equal:theValue(1)];
    });
    it(@"test", ^{
        MaxSequenceSubArrayCount *test = [[MaxSequenceSubArrayCount alloc] init];
        NSInteger max = [test maxSequenceSubArrayCount:@[@(0)]];
        [[theValue(max) should] equal:theValue(1)];
    });
    it(@"test", ^{
        MaxSequenceSubArrayCount *test = [[MaxSequenceSubArrayCount alloc] init];
        NSInteger max = [test maxSequenceSubArrayCount:@[]];
        [[theValue(max) should] equal:theValue(0)];
    });


});

SPEC_END
