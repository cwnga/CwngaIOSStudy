//
//  EAPromotionManager.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 28/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "EAPromotionManager.h"
#import <AppDevKit/AppDevKit.h>
@interface EAPromotionManager ()
@property (strong, nonatomic) NSArray <EAPromotionData *> *controlCenterPromotionDatas;
@property (strong, nonatomic) NSDictionary *cmsPromitonData;
@end

@implementation EAPromotionManager

+ (instancetype)shareInstance
{
    static EAPromotionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
        [manager fetchData];
    });
    return manager;
}
- (void)fetchData
{
    NSArray *controlCenterPromotionDatas = @[
                                             @{@"promotionId":@"freeshipping",
                                               @"pageDatas": @[
                                                       @{
                                                           @"pageId": @"listingPageView",
                                                           @"viewDatas": @[
                                                                   @{
                                                                       @"viewId":@"shippingFamilyPromotionView",
                                                                       @"type":@"text",
                                                                       @"leadingSpace":@(0),
                                                                       @"w":@(60),
                                                                       @"h":@(18),
                                                                       @"cmsParameter":@{
                                                                               //select * from ecauction.common.cms where ccode="tw" and moduleId="yy_auc_onoff" and cmsDataKey="freeshipping" and service="myauction" and property="auction2"
                                                                               @"ccode": @"tw",
                                                                               @"moduleId": @"yy_auc_onoff",
                                                                               @"cmsDataKey": @"freeshipping",
                                                                               @"service": @"myauction",
                                                                               @"property": @"auction2",
                                                                               @"keypath": @"query.results.result.module_setting.sections.m1.grids.g_sign1.fields.f_prod",
                                                                               @"keypathAdoptValue": @"1",
                                                                               //query.results.result.module_setting.sections.m1.grids.g_sign1.fields.f_prod = 0/1
                                                                               },
                                                                       @"contentData":@{
                                                                               @"text": @"全家免運1",
                                                                               @"fontSize": @"12",
                                                                               @"borderWidth": @"0",
                                                                               @"backgroundColorCode": @"ff8a00",
                                                                               @"borderColorCode": @"ff8a00",
                                                                               @"textColorCode": @"ffffff",
                                                                               },
                                                                       },

                                                                   @{
                                                                       @"viewId":@"shippingFamilyPromotionView",
                                                                       @"type":@"text",
                                                                       @"leadingSpace":@(10),
                                                                       @"w":@(60),
                                                                       @"h":@(18),
                                                                       @"cmsParameter":@{
                                                                               //select * from ecauction.common.cms where ccode="tw" and moduleId="yy_auc_onoff" and cmsDataKey="freeshipping" and service="myauction" and property="auction2"
                                                                               @"ccode": @"tw",
                                                                               @"moduleId": @"yy_auc_onoff",
                                                                               @"cmsDataKey": @"freeshipping",
                                                                               @"service": @"myauction",
                                                                               @"property": @"auction2",
                                                                               @"keypath": @"query.results.result.module_setting.sections.m1.grids.g_sign1.fields.f_prod",
                                                                               @"keypathAdoptValue": @"1",
                                                                               //query.results.result.module_setting.sections.m1.grids.g_sign1.fields.f_prod = 0/1
                                                                               },
                                                                       @"contentData":@{
                                                                               @"text": @"全家免運2",
                                                                               @"fontSize": @"12",
                                                                               @"borderWidth": @"0",
                                                                               @"backgroundColorCode": @"ff8a00",
                                                                               @"borderColorCode": @"ff8a00",
                                                                               @"textColorCode": @"ffffff",
                                                                               },
                                                                       },
                                                                   ],
                                                           },
                                                       ],
                                               },
                                             ];
    NSArray <EAPromotionData *> *promotionDatas = [EAPromotionData arrayOfModelsFromDictionaries:controlCenterPromotionDatas error:nil];
    self.controlCenterPromotionDatas = promotionDatas;


    
    self.cmsPromitonData = @{
                             @"ccode:tw,property:auction2,service:myauction,moduleId:yy_auc_onoff,cmsDataKey:freeshipping": @{
                                 @"query": @{
                                         @"results":@{
                                                 @"result":@{
                                                         @"module_setting":@{
                                                                 @"sections":@{
                                                                         @"m1":@{
                                                                                 @"grids":@{
                                                                                         @"g_sign1":@{
                                                                                                 @"fields":@{
                                                                                                         @"f_prod":@"1",
                                                                                                         },
                                                                                                 },
                                                                                         },
                                                                                 }

                                                                         }
                                                                 }
                                                         }
                                                 },
                                         },
                                 },

                             };

}

- (NSArray <UIView *> *)viewsWithPageId:(NSString *)pageId
                        promotionViewId:(NSString *)promotionViewId
{
    NSMutableArray *viewDatas = [NSMutableArray array];
    [self.controlCenterPromotionDatas enumerateObjectsUsingBlock:^(EAPromotionData * _Nonnull promotionData, NSUInteger idx, BOOL * _Nonnull stop) {
        [promotionData.pageDatas enumerateObjectsUsingBlock:^(EAPromotionPageData *pageData, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([pageData.pageId isEqualToString:pageId]) {
                [pageData.viewDatas enumerateObjectsUsingBlock:^(EAPromotionViewData *viewData, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([viewData.viewId isEqualToString:promotionViewId]) {
                        NSString *key = [self keyWithCCode:viewData.cmsParameter.ccode
                                                  property:viewData.cmsParameter.property
                                                   service:viewData.cmsParameter.service
                                                  moduleId:viewData.cmsParameter.moduleId
                                                cmsDataKey:viewData.cmsParameter.cmsDataKey];
                        NSDictionary *cmsData = self.cmsPromitonData[key];
                        if ([[cmsData valueForKeyPath:viewData.cmsParameter.keypath] isEqualToString:viewData.cmsParameter.keypathAdoptValue]) {
                            [viewDatas addObject:viewData];
                        }

                    }
                }];
            }
        }];
    }];
    return [self viewsWithViewDatas:viewDatas];
}
/*
 @"ccode": @"tw",
 @"moduleId": @"yy_auc_onoff",
 @"cmsDataKey": @"freeshipping",
 @"service": @"myauction",
 @"property": @"auction2",
 */
- (NSString *)keyWithCCode:(NSString *)ccode
                  property:(NSString *)property
                   service:(NSString *)service
                   moduleId:(NSString *)moduleId
                   cmsDataKey:(NSString *)cmsDataKey
{
    return [NSString stringWithFormat:@"ccode:%@,property:%@,service:%@,moduleId:%@,cmsDataKey:%@",
            ccode,property,service,moduleId,cmsDataKey];
}

- (NSArray <UIView *> *)viewsWithViewDatas:(NSArray <EAPromotionViewData *>*)promotionViewData
{

    NSMutableArray <UIView *> *views = [NSMutableArray array];
    
    [promotionViewData enumerateObjectsUsingBlock:^(EAPromotionViewData * _Nonnull promotionViewData, NSUInteger idx, BOOL * _Nonnull stop) {

        if ([promotionViewData.contentData isKindOfClass:[EAPromotionViewContentTextData class]]) {
            EAPromotionViewContentTextData *textData = (EAPromotionViewContentTextData *)promotionViewData.contentData;
            [views addObject:[[self class] promotionLabel:textData.text
                                                 fontSize:textData.fontSize
                                          backgroundColor:[UIColor ADKColorWithHexString:textData.backgroundColorCode]
                                              borderColor:[UIColor ADKColorWithHexString:textData.borderColorCode]
                                              borderWidth:textData.borderWidth
                                                textColor:[UIColor ADKColorWithHexString:textData.textColorCode]
                                                     size:[promotionViewData size]
                                                  leading:promotionViewData.leadingSpace]];
        } else if ([promotionViewData.contentData isKindOfClass:[EAPromotionViewContentImageData class]]) {
            EAPromotionViewContentImageData *imageData = (EAPromotionViewContentImageData *)promotionViewData.contentData;
            [views addObject:[[self class] imageViewWithImageName:imageData.imageName
                                                             size:[promotionViewData size]
                                                          leading:promotionViewData.leadingSpace]];
        }
    }];

    CGFloat centerY = 0.0f;
    for (UIView *obj in views) {
        centerY = MAX(centerY, obj.center.y);
    }

    //adjust x,centerY
    CGFloat accx = 0.0f;
    for (UIView *obj in views) {
        CGRect frame = obj.frame;
        frame.origin.x = accx + frame.origin.x;
        obj.frame = frame;
        accx = CGRectGetMaxX(obj.frame);
        obj.center = CGPointMake(obj.center.x, centerY);
    }
    return [views copy];
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
