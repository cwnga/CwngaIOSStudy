//
//  PalindromePartitioningII.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/3/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 Given a string s, partition s such that every substring of the partition is a palindrome.

 Return the minimum cuts needed for a palindrome partitioning of s.

 For example, given s = "aab",
 Return 1 since the palindrome partitioning ["aa","b"] could be produced using 1 cut.

 Subscribe to see which companies asked this question
 */
@interface PalindromePartitioningII : NSObject

- (NSInteger)minCut:(NSString *)string;

@end
