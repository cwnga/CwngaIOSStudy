//
//  EAPromotionData.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 29/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "EAPromotionViewData.h"
#import "EAPromotionPageData.h"

@interface EAPromotionData : JSONModel

@property (strong, nonatomic) NSString *promotionId; //ex: 全家免運活動
@property (strong, nonatomic) NSArray <EAPromotionPageData>*pageDatas;

@end

