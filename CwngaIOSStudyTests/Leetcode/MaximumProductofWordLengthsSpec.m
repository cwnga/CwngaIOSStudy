//
//  MaximumProductofWordLengthsSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Kiwi/Kiwi.h>
#import "MaximumProductofWordLengths.h"

SPEC_BEGIN(MaximumProductofWordLengthsSpec)

describe(@"test WordBreak", ^{

    it(@"test", ^{
        MaximumProductofWordLengths *test = [[MaximumProductofWordLengths alloc] init];
        NSInteger result = [test maxProduct:@[@"abcw",@"baz",@"foo",@"bar",@"xtfn",@"abcdef"]];

        [[theValue(result) should] equal:theValue(16)];
    });
});

SPEC_END
