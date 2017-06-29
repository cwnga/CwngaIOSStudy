//
//  EALiveMessageParser.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 02/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EALiveMessage.h"

@interface EALiveMessageParser : NSObject

+ (NSArray <EALiveMessage *> *)parserMessage:(NSString *)message;

@end
