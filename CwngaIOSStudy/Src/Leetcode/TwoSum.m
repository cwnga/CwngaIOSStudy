//
//  TwoSum.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "TwoSum.h"
#import <UIKit/UIKit.h>
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
//fail if :@[@(NSIntegerMax),@(NSIntegerMax),@(99)] target:-2]; 
- (BOOL)numsO1:(NSArray *)array target:(NSInteger)target
{
    BOOL result = NO;
    if (!array || array.count <= 0) {
        return result;
    }
    for (NSInteger i =0;i < array.count -1;i++) {
        NSInteger leave = target - [array[i] integerValue];
        NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:array];
        [tmpArray removeObjectAtIndex:i];
        result = [tmpArray containsObject:@(leave)];
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
- (BOOL)numsOfloat:(NSArray *)array target:(NSInteger)target
{
    BOOL result = NO;
    if (!array || array.count <= 0) {
        return result;
    }
    array = [array sortedArrayUsingSelector:@selector(compare:)];//O(nlog(n))
    NSInteger start = 0;
    NSInteger end = array.count - 1;


    while (true) { //O(n)
        if (start == end) {
            break;
        }

        if (target != [array[start] floatValue] + [array[end] floatValue]) {
            if (target <[array[start] floatValue] + [array[end] floatValue]) {
                end --;
            } else {
                start++;
            }

        } else {

            result = YES;
            break;
        }

    }


    return result;
}


@end
