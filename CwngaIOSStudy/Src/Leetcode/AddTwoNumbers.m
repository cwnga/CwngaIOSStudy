//
//  AddTwoNumbers.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "AddTwoNumbers.h"

@implementation AddTwoNumbers

- (CwngaListNode *)addTwoNumbers:(CwngaListNode *)node1 node2:(CwngaListNode *)node2
{
    if (!node1 && !node2) {
        return nil;
    }

    CwngaListNode *totalResult;
       CwngaListNode *result = [[CwngaListNode alloc] init];
    totalResult = result;
    NSInteger nextNumber = 0;
    while (node1 || node2 || nextNumber > 0) {
        result.val=(node1.val + node2.val + nextNumber) % 10;
        nextNumber = (node1.val + node2.val + nextNumber) / 10;
        if (node1.next || node2.next || nextNumber > 0) {

            CwngaListNode *nextNode = [[CwngaListNode alloc] init];
            result.next = nextNode;
            result = nextNode;

        }
        node1 = node1.next;
        node2 = node2.next;


    }
    return totalResult;
}
+ (CwngaListNode *)genNodesWithArray:(NSArray *)nodesValues
{
    if (!nodesValues || nodesValues.count == 0) {
        return nil;
    }
    __block CwngaListNode *node = [[CwngaListNode alloc] init];
    CwngaListNode *result = node;
    [nodesValues enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {

        if (idx > 0) {
            CwngaListNode *tmp = [[CwngaListNode alloc] init];
            tmp.val = [obj integerValue];
            node.next = tmp;
            node = tmp;
        } else {
            node.val = [obj integerValue];

        }
    }];
    return result;
}
@end
