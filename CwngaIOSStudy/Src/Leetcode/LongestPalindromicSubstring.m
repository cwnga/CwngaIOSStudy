//
//  LongestPalindromicSubstring.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/4/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "LongestPalindromicSubstring.h"
#import <UIKit/UIKit.h>
@implementation LongestPalindromicSubstring
- (NSString *)longestPalindrome:(NSString *)s
{
    NSString *result = @"";
    if (!s || s.length == 0) {
        return result;
    }
    NSInteger start = 0;
    NSInteger left = 0;
        NSInteger right = 0;
    NSInteger max = 0;

    for (CGFloat i = 0.0f; i < s.length; i+=0.5f) {
        left = floor(i-1);
        right = ceil(i+1);
        while(left >=0 && right < s.length) {
            if ([s characterAtIndex:left] == [s characterAtIndex:right]) {
                left--;
                right++;
            } else {
                break;
            }
        }
        if (right - left - 1> max) {
            max = right - left - 1;
            start = left+1;
        }
    }
    result = [s substringWithRange:NSMakeRange(start, max)];
    return result;
}
@end
