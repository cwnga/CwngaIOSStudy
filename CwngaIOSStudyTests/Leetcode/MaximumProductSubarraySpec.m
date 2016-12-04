//
//  MaximumProductSubarraySpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/4/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <Kiwi/Kiwi.h>
#import "MaximumProductSubarray.h"

SPEC_BEGIN(MaximumProductSubarraySpec)

describe(@"test MaximumProductSubarray", ^{

    it(@"test", ^{
        MaximumProductSubarray *test = [[MaximumProductSubarray alloc] init];
        NSInteger result = [test maxProduct:@[@(-2)]];
        [[theValue(result) should] equal:theValue(-2)];
    });
    it(@"test", ^{
        MaximumProductSubarray *test = [[MaximumProductSubarray alloc] init];
        NSInteger result = [test maxProduct:@[@(-4),@(-3),@(-2)]];
        [[theValue(result) should] equal:theValue(12)];
    });
    it(@"test", ^{
        MaximumProductSubarray *test = [[MaximumProductSubarray alloc] init];
        NSInteger result = [test maxProduct:@[@(1),@(-5),@(6),@(-5),@(2),@(-4),@(-5),@(0),@(3),@(2),@(-4),@(0),@(-5),@(-3),@(-1),@(-4),@(-1),@(4),@(1),@(-1),@(-3),@(-1),@(1),@(3),@(-4),@(-6),@(-2),@(5),@(1),@(-5),@(0),@(-1),@(-5),@(0),@(1),@(2),@(6),@(1),@(2),@(-6),@(5),@(5),@(0),@(1),@(0),@(1),@(1),@(-1),@(-1),@(3),@(1),@(0),@(4),@(-3),@(0),@(4),@(-4),@(-1),@(6),@(5),@(5),@(6),@(-6),@(1),@(1),@(3),@(4),@(3),@(-1),@(-3),@(0),@(-5),@(-4),@(1),@(5),@(-2),@(3),@(-1),@(2),@(1),@(1),@(6),@(0),@(5),@(-5),@(6),@(-6),@(3),@(0),@(4),@(-1),@(3),@(6),@(0),@(-2),@(0),@(-1),@(6),@(4),@(1),@(-5),@(1),@(0),@(1),@(-1),@(-1),@(3),@(5),@(5),@(4),@(2),@(5),@(0),@(-1),@(5),@(2),@(2),@(-3),@(-1),@(-1),@(0),@(-6),@(-2),@(-5),@(1),@(-2),@(2),@(0),@(0),@(2),@(-3),@(-2),@(-4),@(1),@(1),@(-4),@(-3),@(-1),@(0),@(0),@(1),@(-3),@(-2),@(3),@(-4),@(5),@(2),@(-1),@(4),@(1),@(5),@(6),@(0),@(1),@(1),@(-2),@(-1),@(0),@(-1),@(-5),@(5),@(6),@(6),@(-1),@(-1),@(0),@(-4),@(2),@(1),@(3),@(-5),@(6),@(-5),@(-1),@(-1),@(-3),@(-1),@(-4),@(-2),@(-1),@(-1),@(1),@(-3),@(-4),@(0),@(1),@(-3),@(4),@(3),@(2),@(-2),@(6),@(-3),@(-6),@(-6),@(-2),@(-5),@(1),@(2),@(0),@(-1),@(0),@(0),@(-2),@(3),@(-4),@(2),@(4),@(3),@(-1),@(3),@(1),@(0),@(2),@(1),@(-1),@(0),@(5),@(-1),@(-3),@(-6),@(-5),@(0),@(6),@(6),@(-6),@(-5),@(4),@(-2),@(-1),@(0),@(4),@(6),@(-3),@(1),@(-1),@(0),@(1),@(-5),@(5),@(-3),@(-3),@(-3),@(-1),@(-1),@(4),@(0),@(-2),@(-4),@(3),@(5),@(5),@(-1),@(-1),@(-5),@(-2),@(-4),@(-4),@(6),@(0),@(-3),@(-1),@(-5),@(-3),@(-1),@(6),@(1),@(-5),@(-1),@(0),@(1),@(-4),@(-5),@(0),@(0),@(0),@(-3),@(-5),@(-1),@(-4),@(-1),@(5),@(5),@(-4),@(4),@(-1),@(6),@(-1),@(1),@(-1),@(2),@(-2),@(-3),@(0),@(1),@(0),@(0),@(-3),@(0),@(2),@(5),@(-6),@(-3),@(-3),@(3),@(-4),@(-2),@(-6),@(-1),@(1),@(4),@(4),@(0),@(-6),@(-5),@(-6),@(-3),@(5),@(-3),@(1),@(-4),@(6),@(-2),@(0),@(-4),@(-1),@(0),@(-1),@(0),@(6),@(-6),@(0),@(5),@(0),@(1),@(-3),@(6),@(1),@(-1),@(1),@(0),@(-1),@(1),@(-1),@(-6),@(-3),@(4),@(-1),@(-4),@(6),@(4),@(-1),@(-3),@(2),@(-6),@(5),@(0),@(4),@(-2),@(1),@(0),@(4),@(-2),@(2),@(0),@(0),@(5),@(5),@(-3),@(4),@(3),@(-5),@(2),@(2),@(6),@(-1),@(-2),@(1),@(-3),@(1),@(-1),@(6),@(-4),@(0),@(0),@(0),@(2),@(-5),@(-4),@(2),@(6),@(-3),@(-6),@(-1),@(-6),@(0),@(0),@(2),@(-1),@(6),@(-4),@(-5),@(-1),@(0),@(-3),@(-3),@(-1),@(0),@(-4),@(3),@(1),@(5),@(0),@(2),@(5),@(0),@(4),@(-5),@(-1),@(3),@(1),@(-1),@(-1),@(1),@(1),@(-2),@(3),@(5),@(4),@(6),@(2),@(6),@(-6),@(5),@(2),@(-3),@(0),@(-1),@(-1),@(3),@(1),@(1),@(1),@(-2),@(-5),@(3),@(-1),@(3),@(0),@(-1),@(3),@(1),@(1),@(-2),@(6),@(3),@(-6),@(5),@(-5),@(-5),@(0),@(-2),@(-3),@(-3),@(-4),@(6),@(-1),@(-6),@(6),@(-3),@(-5),@(1),@(-1),@(0),@(0),@(1),@(4),@(-5),@(0),@(1),@(-2),@(6),@(1),@(-3),@(-5),@(0),@(4),@(-2),@(1),@(-5),@(-4),@(0),@(0),@(-1),@(-2),@(0),@(2),@(-2),@(5),@(6)]];

        [[theValue(result) should] equal:theValue(31104000)];
    });
});

SPEC_END
