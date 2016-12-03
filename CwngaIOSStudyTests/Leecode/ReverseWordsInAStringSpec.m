//
//  ReverseWordsInAStringSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//



#import <Kiwi/Kiwi.h>
#import "ReverseWordsInAString.h"


SPEC_BEGIN(ReverseWordsInAStringSpec)

describe(@"test ReverseWordsInAString", ^{

    it(@"test", ^{
        ReverseWordsInAString *test = [[ReverseWordsInAString alloc] init];
           NSString *result = [ test reverseWords:@"the sky is blue"];
        [[result should] equal:@"blue is sky the"];
    });
    it(@"test", ^{
        ReverseWordsInAString *test = [[ReverseWordsInAString alloc] init];
        NSString *result = [ test reverseWords:nil];
        [[result should] beNil];
    });


});

SPEC_END
