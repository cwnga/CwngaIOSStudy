//
//  AddTwoNumbersSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Kiwi/Kiwi.h>
#import "AddTwoNumbers.h"

SPEC_BEGIN(AddTwoNumbersSpec)

describe(@"test AddTwoNumbers", ^{

    it(@"test", ^{
        AddTwoNumbers *test = [[AddTwoNumbers alloc] init];
        CwngaListNode *node1 =   [AddTwoNumbers genNodesWithArray:@[@(2),@(4),@(3)]];
        CwngaListNode *node2 =   [AddTwoNumbers genNodesWithArray:@[@(5),@(6),@(4)]];
        CwngaListNode *result = [test addTwoNumbers:node1 node2:node2];
        CwngaListNode *expect =   [AddTwoNumbers genNodesWithArray:@[@(7),@(0),@(8)]];
        BOOL is = [result isEqual:expect];
        [[theValue(is) should] equal:theValue(YES)];
        // (2 -> 4 -> 3) + (5 -> 6 -> 4)

    });
    it(@"test", ^{
        AddTwoNumbers *test = [[AddTwoNumbers alloc] init];
        CwngaListNode *node1 =   [AddTwoNumbers genNodesWithArray:@[@(1),@(5),@(4)]];
        CwngaListNode *node2 =   [AddTwoNumbers genNodesWithArray:@[@(5),@(5),@(5)]];
        CwngaListNode *result = [test addTwoNumbers:node1 node2:node2];
        CwngaListNode *expect =   [AddTwoNumbers genNodesWithArray:@[@(6),@(0),@(0),@(2)]];
        BOOL is = [result isEqual:expect];
        [[theValue(is) should] equal:theValue(NO)];
        // (2 -> 4 -> 3) + (5 -> 6 -> 4)

    });
    it(@"test", ^{
        AddTwoNumbers *test = [[AddTwoNumbers alloc] init];
        CwngaListNode *node1 = [AddTwoNumbers genNodesWithArray:@[@(8),@(2),@(5),@(7),@(7),@(8),@(2),@(9),@(4),@(1)]];
        CwngaListNode *node2 = [AddTwoNumbers genNodesWithArray:@[@(0),@(4),@(3),@(7),@(0),@(1),@(6),@(7),@(6),@(1)]];
        CwngaListNode *result = [test addTwoNumbers:node1 node2:node2];
        CwngaListNode *expect = [AddTwoNumbers genNodesWithArray:@[@(8),@(6),@(8),@(4),@(8),@(9),@(8),@(6),@(1),@(3)]];
        BOOL is = [result isEqual:expect];
        [[theValue(is) should] equal:theValue(YES)];
    });
});

SPEC_END
