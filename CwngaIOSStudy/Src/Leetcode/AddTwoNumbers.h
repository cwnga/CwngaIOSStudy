//
//  AddTwoNumbers.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//
/*
 https://leetcode.com/problems/add-two-numbers/
 You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8

 Subscribe to see which companies asked this question

 */

#import <Foundation/Foundation.h>
#import "CwngaListNode.h"
@interface AddTwoNumbers : NSObject
- (CwngaListNode *)addTwoNumbers:(CwngaListNode *)node1 node2:(CwngaListNode *)node2;
+ (CwngaListNode *)genNodesWithArray:(NSArray *)nodesValues;

@end
