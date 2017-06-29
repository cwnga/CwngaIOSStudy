//
//  EAPromotionViewContentData.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 29/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "EAPromotionViewContentData.h"

@implementation EAPromotionViewContentData

@end


////PromotionViewTextData

@implementation EAPromotionViewContextTextData

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    static NSSet *optionalFields;
    optionalFields = [[NSSet alloc] initWithObjects:@"fontSize", @"borderWidth", nil];
    if ([optionalFields containsObject:propertyName]) {
        return YES;
    } else {
        return [super propertyIsOptional:propertyName];
    }
}

@end

@implementation EAPromotionViewContentImageData

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return [super propertyIsOptional:propertyName];
}

@end


