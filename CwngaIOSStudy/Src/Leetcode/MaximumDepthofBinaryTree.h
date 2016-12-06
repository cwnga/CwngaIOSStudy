//
//  MaximumDepthofBinaryTree.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

/*
 Maximum Depth of Binary Tree
 https://leetcode.com/problems/maximum-depth-of-binary-tree/
 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Subscribe to see which companies asked this question

 */
#import <Foundation/Foundation.h>
#import "CwngaNode.h"

@interface MaximumDepthofBinaryTree : NSObject
- (NSInteger)maxDepth:(CwngaNode *)node;
@end
