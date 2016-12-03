//
//  PalindromePartitioningII.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "PalindromePartitioningII.h"

@implementation PalindromePartitioningII

- (NSInteger)minCut:(NSString *)string
{
    NSMutableDictionary *minCutDic = [NSMutableDictionary dictionary];
        minCutDic[@(-1)] = @(-1);
    for (NSInteger i = 0; i < string.length; i++) {
        //NOTE: default every char need cut;
        minCutDic[@(i)] = @(i);
    }
    for (NSInteger i = 0; i < string.length; i++) {
       for (NSInteger j=0;
            i-j>=0 && i+j <= string.length -1 && [string characterAtIndex:i-j] ==[string characterAtIndex:i+j];
            j++) {
           //for aba
           NSInteger min = MIN([minCutDic[@(i-j-1)] integerValue] + 1, [minCutDic[@(i+j)] integerValue]) ;
           minCutDic[@(i+j)] = @(min);
        }
        for (NSInteger j=0;
             i-j>=0 && i+j <= string.length -1 && [string characterAtIndex:i-j-1] == [string characterAtIndex:i+j];
             j++) {
            //for i = 2, j = 1, abba

            NSInteger min = MIN([minCutDic[@(i-j-2)] integerValue] + 1, [minCutDic[@(i+j)] integerValue]) ;
            minCutDic[@(i+j)] = @(min);
        }
    }
    if (string.length == 0) {
        return [minCutDic[@(-1)] integerValue];
    }
    return [minCutDic[@(string.length - 1)] integerValue];
}
@end
