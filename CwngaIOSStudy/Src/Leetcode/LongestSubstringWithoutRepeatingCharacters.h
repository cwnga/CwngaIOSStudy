//
//  LongestSubstringWithoutRepeatingCharacters.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/4/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 
 Given a string, find the length of the longest substring without repeating characters.

 Examples:

 Given "abcabcbb", the answer is "abc", which the length is 3.

 Given "bbbbb", the answer is "b", with the length of 1.

 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
*/
@interface LongestSubstringWithoutRepeatingCharacters : NSObject

- (NSInteger)lengthOfLongestSubstring:(NSString *)string;

@end
