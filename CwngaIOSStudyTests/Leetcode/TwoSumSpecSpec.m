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
        BOOL is = [test numsOfloat:@[@(1),@(2),@(3)] target:3];
        [[theValue(is) should] equal:theValue(YES)];
    });

    it(@"test", ^{
        TwoSum *test = [[TwoSum alloc] init];
        BOOL is = [test numsOfloat:@[@(1),@(1),@(3)] target:3];
        [[theValue(is) should] equal:theValue(NO)];

    });

    it(@"test", ^{
        TwoSum *test = [[TwoSum alloc] init];
        BOOL is = [test numsOfloat:@[@(2),@(1),@(4)] target:4];
        [[theValue(is) should] equal:theValue(NO)];
    });
    it(@"test", ^{
        TwoSum *test = [[TwoSum alloc] init];
        BOOL is = [test numsOfloat:@[@(NSIntegerMax),@(NSIntegerMax),@(99)] target:-2];
        [[theValue(is) should] equal:theValue(NO)];
    });
//    it(@"test", ^{
//        TwoSum *test = [[TwoSum alloc] init];
//        BOOL is = [test numsO1:@[@(NSIntegerMax),@(NSIntegerMax),@(99)] target:-2]; //will fail@@
//        [[theValue(is) should] equal:theValue(NO)];
//    });

});

SPEC_END
