//
//  CwngaNode.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "CwngaNode.h"

@implementation CwngaNode

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %f", [super description], self.value];
}

@end
