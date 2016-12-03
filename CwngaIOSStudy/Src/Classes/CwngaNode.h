//
//  CwngaNode.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CwngaNode : NSObject

@property (assign, nonatomic) CGFloat value;
@property (strong, nonatomic) CwngaNode *leftNode;
@property (strong, nonatomic) CwngaNode *rightNode;

@end
