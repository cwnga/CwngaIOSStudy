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
    //NSLog(@"charLastIndexMap:%@",charLastIndexMap);

    for (NSInteger i = 0, j = 0; i < string.length; i++) {
        //NSLog(@"===Loop=i:(%ld),j,(%ld)==",i,j);
        NSString *chart = [string substringWithRange:NSMakeRange(i, 1)];
        if (charLastIndexMap[chart]) {
            //            NSLog(@"===MAPPED===");
            //            NSLog(@"charLastIndexMap[chart]{%@} => %ld",chart, [charLastIndexMap[chart] integerValue]);
            //            NSLog(@"j:%ld",j);

            j = MAX(j, [charLastIndexMap[chart] integerValue] + 1);
        }
        charLastIndexMap[chart] = @(i);
        //NSLog(@"substring:start:[i(%ld)-j(%ld)], length:(%ld), text:(%@)",i,j, i - j + 1, [string substringWithRange:NSMakeRange(j,  i - j + 1)]);
        max = MAX(max, i - j + 1);
        //NSLog(@"new max:%ld", max);
        //NSLog(@"charLastIndexMap:%@",charLastIndexMap);

    }
    //    NSLog(@"charLastIndexMap:%@",charLastIndexMap);
    //    NSLog(@"max:%ld",max);
    
    
    return max;
    
}
@end
