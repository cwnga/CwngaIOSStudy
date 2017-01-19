//
//  SKImageLikeAnimationView.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 1/18/17.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKImageLikeAnimationView : UIView
@property (assign, nonatomic) NSUInteger maxFireImageCount;
-(void)fireImage:(UIImage *)image size:(CGSize)size duration:(CGFloat)duration scale:(CGFloat)scale alpha:(CGFloat)alpha;

@end
