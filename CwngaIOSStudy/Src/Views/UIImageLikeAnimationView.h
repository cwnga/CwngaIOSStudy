//
//  UIImageLikeAnimationView.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 21/01/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageLikeAnimationView : UIView

@property (assign, nonatomic) NSUInteger maxFireImageCount;

-(void)fireImage:(UIImage *)image size:(CGSize)size duration:(CGFloat)duration scale:(CGFloat)scale alpha:(CGFloat)alpha;

@end
