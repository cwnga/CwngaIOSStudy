//
//  LongestPalindromicSubstring.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/4/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//
/*
 Longest Palindromic Substring
 https://leetcode.com/problems/longest-palindromic-substring/

 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

 Example:

 Input: "babad"

 Output: "bab"

 Note: "aba" is also a valid answer.
 Example:

 Input: "cbbd"

 Output: "bb"

 */
#import <Foundation/Foundation.h>

@interface LongestPalindromicSubstring : NSObject
- (NSString *)longestPalindrome:(NSString *)s;
@end
