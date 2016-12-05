//
//  DecodeWays.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//
/*
 https://leetcode.com/problems/decode-ways/
 A message containing letters from A-Z is being encoded to numbers using the following mapping:

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given an encoded message containing digits, determine the total number of ways to decode it.

 For example,
 Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).

 The number of ways decoding "12" is 2.

 Subscribe to see which companies asked this question
 */


#import "DecodeWays.h"

@implementation DecodeWays
//string: 0-9....
//example: "01" -> 0, can not decode
//example: "10" -> 1, only j
//example: "11" -> 2, "AA" or "K"
//hint:
//default: dp[i] = 0;
//¨
//if ((pre * 10+current) >=10 || <=26) {
//   dp[i] = dp[i] + dp[i-2];
//}

-(NSInteger)numDecodings:(NSString *)string
{
    NSTimeInterval startTime  = [[NSDate date] timeIntervalSince1970];


    NSInteger result = 0;
    NSArray *stringArray;
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i=0; i < string.length; i++) {
        NSString *tmp_str = [string substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:[tmp_str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    stringArray = [arr copy];
    NSMutableArray *dp = [NSMutableArray array];


    if ([stringArray count] == 0 || [stringArray[0] isEqualToString:@"0"]) {
        return result;
    } else {

        dp[0] = @(1);
        dp[1] = @(0);
        if ([stringArray count] >= 2) {
            // two number!
            NSInteger number = [stringArray[0] integerValue] * 10 + [stringArray[1] integerValue];
            if (number >= 10 && number <= 26) {
                dp[1] = @(1);
            }
            if ([stringArray[1] integerValue] > 0) {
                dp[1] = @([dp[1] integerValue]+[dp[0] integerValue]);
            }
        }



        for (NSInteger i = 2; i < [stringArray count]; i++) {
            dp[i] = @(0);
            NSInteger iInteger = [stringArray[i] integerValue];
            NSInteger i_1Integer = [stringArray[i - 1] integerValue];
            NSInteger x = i_1Integer * 10 + iInteger;
            if (iInteger != 0) {
                //for 112 -> last resut:  (1)+(1),  (11):
                //current: (1)+(1) + (2) and (11) + (2), same dp count
                //for 110 -> last resut: (1)+(1),  (11):
                //current: (1)+(1) + (0):X and (11) + (0):X //can not 0 :(
                dp[i] = dp[i-1];
            }
            if (x >= 10 && x <=26) {
                //for current result + last 2 result
                //current: (1)+(1) + (2) and (11) + (2), same dp count
                //add last 2 result: (1), to be (1) + (12)
                dp[i] =  @([dp[i] integerValue] + [dp[i-2] integerValue]);
            }

        }
    }

    NSTimeInterval endTime  = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%@::%@ dur:%f sec",NSStringFromClass([self class]), NSStringFromSelector(@selector(numDecodings:)), endTime - startTime);

    return [dp[stringArray.count - 1] integerValue];

}
@end
