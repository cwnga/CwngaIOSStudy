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

+ (instancetype)shareInstance;
- (instancetype)init NS_UNAVAILABLE;
- (NSArray <UIView *> *)viewsWithPageId:(NSString *)pageId
                        promotionViewId:(NSString *)promotionViewId;

@end
