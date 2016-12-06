//
//  CountCompleteTreeNodes.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//
/*
 https://leetcode.com/problems/count-complete-tree-nodes/
 Given a complete binary tree, count the number of nodes.

 Definition of a complete binary tree from Wikipedia:
 In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

 Subscribe to see which companies asked this question


 */
#import <Foundation/Foundation.h>
#import "CwngaNode.h"

@interface CountCompleteTreeNodes : NSObject
- (NSInteger)countNodes:(CwngaNode *)node;
@end
