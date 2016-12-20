//
//  LongestSubstringWithoutRepeatingCharacters.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/4/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "LongestSubstringWithoutRepeatingCharacters.h"

@implementation LongestSubstringWithoutRepeatingCharacters
- (NSInteger)lengthOfLongestSubstring:(NSString *)string
{
    NSInteger max = 0;
    NSMutableDictionary *charLastIndexMap = [NSMutableDictionary dictionary];
    for (NSInteger i = 0, j = 0; i < string.length; i++) {
        NSString *chart = [string substringWithRange:NSMakeRange(i, 1)];
        if (charLastIndexMap[chart]) {
            j = MAX(j, [charLastIndexMap[chart] integerValue] + 1);
        }
        charLastIndexMap[chart] = @(i);
        max = MAX(max, i - j + 1);
    }
    return max;
    
}
@end
