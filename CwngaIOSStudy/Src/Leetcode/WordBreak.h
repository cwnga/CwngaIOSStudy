//
//  WordBreak.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordBreak : NSObject
- (BOOL) wordBreak:(NSString *)s wordDict:(NSSet *)set;
@end
