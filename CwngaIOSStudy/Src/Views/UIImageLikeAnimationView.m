//
//  UIImageLikeAnimationView.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 21/01/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "UIImageLikeAnimationView.h"
@interface UIImageLikeAnimationView ()

@property (assign, nonatomic) NSUInteger nowFireImageCount;

@end

@implementation UIImageLikeAnimationView

- (instancetype)init
{
    self = [super init];
    [self setup];
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)setup
{
    self.maxFireImageCount = 10000;

}
-(void)fireImage:(UIImage *)image size:(CGSize)size duration:(CGFloat)duration scale:(CGFloat)scale alpha:(CGFloat)alpha
{
    if (self.nowFireImageCount < self.maxFireImageCount) {
        self.nowFireImageCount++;

        CGFloat moveX = self.bounds.size.width -  (float)rand() / RAND_MAX * self.bounds.size.width;
        CGFloat moveY = self.bounds.size.height - (float)rand() / RAND_MAX * self.bounds.size.height;

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                               0,
                                                                               size.width,
                                                                               size.height)];
        [self addSubview:imageView];
        imageView.image = image;
        imageView.center = CGPointMake(self.bounds.size.width / 2.0f, self.bounds.size.height - size.height / 2.0f);
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:duration animations:^{

            imageView.center = CGPointMake(moveX, moveY);
            imageView.transform = CGAffineTransformMakeScale(scale, scale);
            imageView.alpha = alpha;

        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
            weakSelf.nowFireImageCount--;
            
        }];
        

    }
}
@end
