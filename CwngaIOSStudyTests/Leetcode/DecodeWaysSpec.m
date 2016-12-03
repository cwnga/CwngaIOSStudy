//
//  DecodeWaysSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "DecodeWays.h"


SPEC_BEGIN(DecodeWaysSpec)

describe(@"test DecodeWays", ^{

    it(@"test", ^{
        DecodeWays *test = [[DecodeWays alloc] init];
        NSInteger result = [ test numDecodings:@"0"];
        [[theValue(result) should] equal:theValue(0)];
    });
    it(@"test", ^{
        DecodeWays *test = [[DecodeWays alloc] init];
        NSInteger result = [ test numDecodings:@"011"];
        [[theValue(result) should] equal:theValue(0)];
    });


    it(@"test", ^{
        DecodeWays *test = [[DecodeWays alloc] init];
        NSInteger result = [ test numDecodings:@"10"];
        [[theValue(result) should] equal:theValue(1)];
    });
    it(@"test", ^{
        DecodeWays *test = [[DecodeWays alloc] init];
        NSInteger result = [ test numDecodings:@"119"];
        [[theValue(result) should] equal:theValue(3)];
    });

    it(@"test", ^{
        DecodeWays *test = [[DecodeWays alloc] init];
        NSInteger result = [ test numDecodings:@"129"];
        [[theValue(result) should] equal:theValue(2)];
    });


    it(@"test", ^{
        DecodeWays *test = [[DecodeWays alloc] init];
        NSInteger result = [ test numDecodings:@"192"];
        [[theValue(result) should] equal:theValue(2)];
    });


    it(@"test", ^{
        DecodeWays *test = [[DecodeWays alloc] init];
        NSInteger result = [ test numDecodings:@"301"];
        [[theValue(result) should] equal:theValue(0)];
    });
});

SPEC_END
