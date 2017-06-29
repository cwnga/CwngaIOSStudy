//
//  EAPromotionManager.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 28/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "EAPromotionData.h"

///manager
@interface EAPromotionManager : NSObject

+ (EAPromotionViewData *)dataWithDictionary:(NSDictionary *)dict;
+ (NSArray <EAPromotionViewData *> *)dataWithDicts:(NSArray *)dataArray;
+ (NSArray <UIView *> *)viewsWithViewDatas:(NSArray <EAPromotionViewData *>*)viewDatas;
+ (UIImageView *)imageViewWithImageName:(NSString *)imageName
                                   size:(CGSize)size
                                leading:(CGFloat)leading;


+ (UILabel *)promotionLabel:(NSString *)text
                   fontSize:(NSInteger)fontSize
            backgroundColor:(UIColor *)backgroundColor
                borderColor:(UIColor *)borderColor
                borderWidth:(CGFloat)borderWidth
                  textColor:(UIColor *)textColor
                       size:(CGSize)size
                    leading:(CGFloat)leading;

@end
