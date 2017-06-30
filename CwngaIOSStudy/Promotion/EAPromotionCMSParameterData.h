//
//  EAPromotionCMSParameterData.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 29/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface EAPromotionCMSParameterData : JSONModel
//select * from ecauction.common.cms where ccode="tw" and moduleId="auction_promo_context" and cmsDataKey="freeshipping" and service="myauction" and property="auction2"
@property (strong, nonatomic) NSString *ccode;
@property (strong, nonatomic) NSString *moduleId;
@property (strong, nonatomic) NSString *cmsDataKey;
@property (strong, nonatomic) NSString *service;
@property (strong, nonatomic) NSString *property;
@property (strong, nonatomic) NSString *keypath;
@property (strong, nonatomic) NSString *keypathAdoptValue;

@end
