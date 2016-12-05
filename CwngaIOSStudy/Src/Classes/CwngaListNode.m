//
//  CwngaListNode.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "CwngaListNode.h"

@implementation CwngaListNode

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"%@ val:@{%ld} next:{%@}", self, self.val, self.next];
}
- (BOOL)isEqual:(CwngaListNode *)object
{
    CwngaListNode *tmp = self;
    BOOL result = YES;
    while (true) {
        if (tmp && object && (tmp.val != object.val)) {
            result = NO;
        }
        if ((!tmp && object)|| (tmp && !object)) {
            result = NO;
        }
        if ((!tmp || !object)) {
            break;
        }
        tmp = tmp.next;
        object = object.next;
    }
    return result;
}

@end
