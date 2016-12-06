//
//  WordBreakSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <Kiwi/Kiwi.h>
#import "WordBreak.h"

SPEC_BEGIN(WordBreakSpec)

describe(@"test WordBreak", ^{

    it(@"test", ^{
        WordBreak *test = [[WordBreak alloc] init];
        BOOL result = [test wordBreak:@"leetcode" wordDict:[NSSet setWithObjects:@"leet",@"code", nil]];
        [[theValue(result) should] equal:theValue(YES)];
    });

});

SPEC_END
