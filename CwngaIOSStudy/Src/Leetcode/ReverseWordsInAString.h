//
//  ReverseWordsInAString.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

/*
 https://leetcode.com/problems/reverse-words-in-a-string/
 Given an input string, reverse the string word by word.

 For example,
 Given s = "the sky is blue",
 return "blue is sky the".

 Update (2015-02-12):
 For C programmers: Try to solve it in-place in O(1) space.

 click to show clarification.

 Subscribe to see which companies asked this question
 */

#import <Foundation/Foundation.h>

@interface ReverseWordsInAString : NSObject
- (NSString *)reverseWords:(NSString *)string;
@end
