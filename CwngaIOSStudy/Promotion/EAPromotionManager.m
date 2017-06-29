//
//  EAPromotionManager.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 28/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "EAPromotionManager.h"
#import <AppDevKit/AppDevKit.h>



@implementation EAPromotionManager


+ (NSArray <EAPromotionViewData *> *)dataWithDicts:(NSArray *)dataArray;
{
    NSMutableArray *viewDatas = [NSMutableArray array];
    [dataArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        EAPromotionViewData *viewData = [[self class] dataWithDictionary:dict];
        if (viewData) {
            [viewDatas addObject:viewData];
        }
    }];

    return viewDatas;
}

+ (EAPromotionViewData *)dataWithDictionary:(NSDictionary *)dict;
{
    return nil;
//    EAPromotionViewData *viewData;
//    if (dict[@"type"]) {
//        EAPromotionViewDataType type = [dict[@"type"] integerValue];
//        switch (type) {
//            case EAPromotionViewDataTypeText:
//                viewData = [[EAPromotionViewTextData alloc] initWithDictionary:dict error:nil];
//                break;
//            case EAPromotionViewDataTypeImageType:
//                viewData = [[EAPromotionViewImageData alloc] initWithDictionary:dict error:nil];
//                break;
//            default:
//                break;
//        }
//    }
//    return viewData;
}
+ (NSArray <UIView *> *)viewsWithViewDatas:(NSArray <EAPromotionViewData *>*)viewDatas
{
    return nil;
//
//    NSMutableArray <UIView *> *views = [NSMutableArray array];
//    [viewDatas enumerateObjectsUsingBlock:^(EAPromotionViewData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj isKindOfClass:[EAPromotionViewTextData class]]) {
//            EAPromotionViewTextData *textData = (EAPromotionViewTextData *)obj;
//            [views addObject:[[self class] promotionLabel:textData.text
//                                                 fontSize:textData.fontSize
//                                          backgroundColor:[UIColor ADKColorWithHexString:textData.backgroundColorCode]
//                                              borderColor:[UIColor ADKColorWithHexString:textData.borderColorCode]
//                                              borderWidth:textData.borderWidth
//                                                textColor:[UIColor ADKColorWithHexString:textData.textColorCode]
//                                                     size:[textData size]
//                                                  leading:textData.leadingSpace]];
//        } else if ([obj isKindOfClass:[EAPromotionViewImageData class]]) {
//            EAPromotionViewImageData *imageData = (EAPromotionViewImageData *)obj;
//            [views addObject:[[self class] imageViewWithImageName:imageData.imageName size:[imageData size] leading:imageData.leadingSpace]];
//        }
//    }];
//    CGFloat centerY = 0.0f;
//    for (UIView *obj in views) {
//        centerY = MAX(centerY, obj.center.y);
//    }
//
//    //adjust x,centerY
//    CGFloat accx = 0.0f;
//    for (UIView *obj in views) {
//        CGRect frame = obj.frame;
//        frame.origin.x = accx + frame.origin.x;
//        obj.frame = frame;
//        accx = CGRectGetMaxX(obj.frame);
//        obj.center = CGPointMake(obj.center.x, centerY);
//    }
//    return views;
}

+ (UIImageView *)imageViewWithImageName:(NSString *)imageName
                                   size:(CGSize)size
                                leading:(CGFloat)leading
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.frame = CGRectMake(leading, 0, size.width, size.height);
    return imageView;
}

+ (UILabel *)promotionLabel:(NSString *)text
                   fontSize:(NSInteger)fontSize
            backgroundColor:(UIColor *)backgroundColor
                borderColor:(UIColor *)borderColor
                borderWidth:(CGFloat)borderWidth
                  textColor:(UIColor *)textColor
                       size:(CGSize)size
                    leading:(CGFloat)leading
{
    UILabel *promotionLabel = [[UILabel alloc] initWithFrame:CGRectMake(leading, 0, size.width, size.height)];
    promotionLabel.layer.cornerRadius = 2.0f;
    promotionLabel.layer.masksToBounds = YES;
    promotionLabel.backgroundColor = backgroundColor;
    promotionLabel.layer.borderColor = borderColor.CGColor;
    promotionLabel.layer.borderWidth = borderWidth;

    promotionLabel.textAlignment = NSTextAlignmentCenter;
    promotionLabel.font = [UIFont fontWithName:promotionLabel.font.fontName size:fontSize];
    promotionLabel.textColor = textColor;
    [promotionLabel setText:text];
    return promotionLabel;
}

@end
