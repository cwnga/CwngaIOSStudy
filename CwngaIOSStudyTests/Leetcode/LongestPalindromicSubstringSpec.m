//
//  LongestPalindromicSubstringSpec.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 12/4/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <Kiwi/Kiwi.h>
#import "LongestPalindromicSubstring.h"

SPEC_BEGIN(LongestPalindromicSubstringSpec)

describe(@"test LongestPalindromicSubstring", ^{

    it(@"test", ^{
        LongestPalindromicSubstring *test = [[LongestPalindromicSubstring alloc] init];
        NSString *result =  [test longestPalindrome:@"babad"];
        [[result should] equal:@"bab"];
    });
    it(@"test", ^{
        LongestPalindromicSubstring *test = [[LongestPalindromicSubstring alloc] init];
        NSString *result =  [test longestPalindrome:@"civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"];
        [[result should] equal:@"ranynar"];
    });
});

SPEC_END
