//
//  WordBreak.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/6/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 https://leetcode.com/problems/word-break/
 
 Given a string s and a dictionary of words dict, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

 For example, given
 s = "leetcode",
 dict = ["leet", "code"].

 Return true because "leetcode" can be segmented as "leet code".
 

 */
@interface WordBreak : NSObject
- (BOOL) wordBreak:(NSString *)s wordDict:(NSSet *)set;
@end
