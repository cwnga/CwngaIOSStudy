//
//  EAPromotionViewData.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 29/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "EAPromotionCMSParameterData.h"
#import "EAPromotionViewContentData.h"

@protocol EAPromotionViewData;

@interface EAPromotionViewData : JSONModel
@property (assign, nonatomic) CGFloat leadingSpace;
@property (assign, nonatomic) CGFloat w;
@property (assign, nonatomic) CGFloat h;
@property (strong, nonatomic) EAPromotionCMSParameterData *cmsParameter;
@property (strong, nonatomic) NSString *viewId;
@property (strong, nonatomic) NSString *type;  //text, image
@property (strong, nonatomic) EAPromotionViewContentData *contentData;

- (CGSize)size;

@end



