//
//  TwoSum.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "TwoSum.h"

@implementation TwoSum
- (BOOL)nums:(NSArray *)array target:(NSInteger)target
{
    BOOL result = NO;
    if (!array || array.count <= 0) {
        return result;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSInteger i =0;i < array.count -1;i++) {

        dic[@(i)] = @(1);
    }
    
    for (NSInteger i =0;i < array.count -1;i++) {
        NSInteger leave = target - [array[i] integerValue];
        if (dic[@(leave)]) {
            result = YES;
            break;
        }
    }

    return result;
}

- (BOOL)numsO1:(NSArray *)array target:(NSInteger)target
{
    BOOL result = NO;
    if (!array || array.count <= 0) {
        return result;
    }
   array =  [array sortedArrayUsingSelector:@selector(compare:)];
    for (NSInteger i =0;i < array.count -1;i++) {
        NSInteger leave = target - [array[i] integerValue];
        result = [array containsObject:@(leave)];
        if (result) {
            break;
        }
        /*
        NSArray *tmpArray = array;
        while(true) {
            if ([tmpArray.firstObject integerValue] != leave) {
                if (leave <[tmpArray[tmpArray.count /2] integerValue]) {
                    if (tmpArray.count == 0) {
                        break;
                    }
                    tmpArray = [tmpArray subarrayWithRange:NSMakeRange(0,tmpArray.count / 2)];
                }else  {
                    if (tmpArray.count == 0) {
                        break;
                    }
                    tmpArray = [tmpArray subarrayWithRange:NSMakeRange(tmpArray.count / 2,tmpArray.count / 2)];
                }
            } else {
                result = YES;
                break;
            }

        }
        if (result == YES) {
            break;
        }
        */

    }

    return result;
}


@end
