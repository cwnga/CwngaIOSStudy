//
//  TwoSumSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <Kiwi/Kiwi.h>
#import "TwoSum.h"

SPEC_BEGIN(TwoSumSpec)

describe(@"test TwoSum", ^{

    it(@"test", ^{
        TwoSum *test = [[TwoSum alloc] init];
        BOOL is = [test numsO1:@[@(1),@(2),@(3)] target:3];
        [[theValue(is) should] equal:theValue(YES)];
        // (2 -> 4 -> 3) + (5 -> 6 -> 4)

    });


    it(@"test", ^{
        TwoSum *test = [[TwoSum alloc] init];
        BOOL is = [test numsO1:@[@(1),@(1),@(3)] target:3];
        [[theValue(is) should] equal:theValue(NO)];
        // (2 -> 4 -> 3) + (5 -> 6 -> 4)

    });
    it(@"test", ^{
        TwoSum *test = [[TwoSum alloc] init];
        BOOL is = [test numsO1:@[@(2),@(1),@(4)] target:4];
        [[theValue(is) should] equal:theValue(NO)];
        // (2 -> 4 -> 3) + (5 -> 6 -> 4)

    });



});

SPEC_END
