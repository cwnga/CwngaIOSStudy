//
//  EAPromotionViewData.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 29/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "EAPromotionViewData.h"



@implementation EAPromotionViewData

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err
{
    self = [super initWithDictionary:dict error:err];
    EAPromotionViewContentData *contentData;
    if ([dict[@"type"] isEqualToString:@"text"]) {
        contentData = [[EAPromotionViewContextTextData alloc] initWithDictionary:dict[@"contentData"] error:err];
    } else if ([dict[@"type"] isEqualToString:@"image"]) {
        contentData = [[EAPromotionViewContentImageData alloc] initWithDictionary:dict[@"contentData"] error:err];
    }
    self.contentData = contentData;
    NSLog(@"self:%@", self);
    return self;
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    static NSSet *optionalFields;
    optionalFields = [[NSSet alloc] initWithObjects:@"leadingSpace",@"w", @"h", nil];

    if ([optionalFields containsObject:propertyName]) {
        return YES;
    }
    return NO;
}
- (CGSize)size
{
    return CGSizeMake(self.w, self.h);
}
@end

