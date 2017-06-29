//
//  EAPromotionViewContentData.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 29/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@protocol EAPromotionViewContentData;
@interface EAPromotionViewContentData : JSONModel
@end

////text data
@interface EAPromotionViewContextTextData : EAPromotionViewContentData
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) CGFloat fontSize;
@property (assign, nonatomic) CGFloat borderWidth;
@property (strong, nonatomic) NSString *backgroundColorCode;
@property (strong, nonatomic) NSString *borderColorCode;
@property (strong, nonatomic) NSString *textColorCode;
@end

////image data
@interface EAPromotionViewContentImageData : EAPromotionViewContentData
@property (strong, nonatomic) NSString *imageName;
@end

