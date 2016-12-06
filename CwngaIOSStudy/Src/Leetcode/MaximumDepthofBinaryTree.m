//
//  MaximumDepthofBinaryTree.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "MaximumDepthofBinaryTree.h"

@implementation MaximumDepthofBinaryTree

- (NSInteger)maxDepth:(CwngaNode *)node
{
    if (!node) {
        return 0;
    }
    return MAX(1+ [self maxDepth:node.leftNode], 1+ [self maxDepth:node.rightNode]);

}
@end
