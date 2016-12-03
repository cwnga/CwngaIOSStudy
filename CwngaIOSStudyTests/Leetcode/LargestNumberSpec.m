//
//  LargestNumberSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//


#import <Foundation/Foundation.h>

#import <Kiwi/Kiwi.h>
#import "LargestNumber.h"


SPEC_BEGIN(LargestNumberSpec)

describe(@"test LargestNumber", ^{

    it(@"test", ^{
        LargestNumber *test = [[LargestNumber alloc] init];
        NSString *result = [test largestNumber:@[]];
        [[result should] equal:@""];
    });
    it(@"test", ^{
        LargestNumber *test = [[LargestNumber alloc] init];
        NSString *result = [test largestNumber:@[@(3), @(30), @(34), @(5), @(9)]];
        [[result should] equal:@"9534330"];
    });



});

SPEC_END
