//
//  EAPromotionPageData.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 29/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "EAPromotionViewData.h"
@protocol EAPromotionPageData;

@interface EAPromotionPageData : JSONModel

@property (strong, nonatomic) NSString *pageId; //ex: item page
@property (strong, nonatomic) NSArray <EAPromotionViewData> *viewDatas;

@end
