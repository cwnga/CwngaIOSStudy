//
//  CwngaListNode.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/5/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CwngaListNode : NSObject

@property (assign, nonatomic) NSInteger val;
@property (strong, nonatomic) CwngaListNode *next;

@end
