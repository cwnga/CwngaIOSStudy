//
//  MaximumProductofWordLengths.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "MaximumProductofWordLengths.h"

@implementation MaximumProductofWordLengths
- (NSInteger)maxProduct:(NSArray *)words
{
    NSInteger result = 0;
    NSMutableArray *codes = [NSMutableArray array];
    for (NSInteger i =0; i < words.count; i++) {
        codes[i] = @([self encode:words[i]]);
    }

    for (NSInteger i = 0; i < words.count; i++) {
        for (NSInteger j = i+1;j < words.count; j++) {
            if (([codes[i] integerValue] & [codes[j] integerValue]) == 0) {
                result = MAX([words[i] length] * [words[j] length], result);
            }
        }

    }
    return result;
}
- (NSInteger)encode:(NSString *)word
{
    NSInteger encode = 0;
    for (NSInteger i = 0; i<word.length; i++) {
        encode|= 1 << (int)[word characterAtIndex:i];
    }
    return encode;
}
@end
