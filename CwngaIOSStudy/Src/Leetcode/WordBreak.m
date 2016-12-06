//
//  WordBreak.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "WordBreak.h"

@implementation WordBreak

- (BOOL) wordBreak:(NSString *)s wordDict:(NSSet *)set
{
    if (!s || s.length == 0) {
        return NO;
    }
    BOOL result = NO;
    NSMutableDictionary *dp = [NSMutableDictionary dictionary];

    dp[@(0)] = @(1);


    for (NSInteger i = 1; i <= s.length; i++) {
        for (NSInteger j = i-1; j >= 0 && i-j>0; j--) {
            NSInteger length = i - j;
            NSString *subString = [s substringWithRange:NSMakeRange(j, length)];
            if (!dp[@(j)]) {
                continue;

            }
            if ([set containsObject:subString]) {
                dp[@(i)] = @(1);
                break;
            }
        }

    }
    result = dp[@(s.length)] ? [dp[@(s.length)] boolValue] : NO;
    return result;
}
@end
