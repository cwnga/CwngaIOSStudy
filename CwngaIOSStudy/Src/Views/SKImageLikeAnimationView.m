//
//  SKImageLikeAnimationView.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 1/18/17.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "SKImageLikeAnimationView.h"

#import <SpriteKit/SpriteKit.h>

@interface SKImageLikeAnimationView ()

@property (strong, nonatomic) SKView *skView;

@property (strong, nonatomic) SKScene *skScene;

@property (assign, nonatomic) NSUInteger nowFireImageCount;

@end

@implementation SKImageLikeAnimationView


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
    [self setAutoresizesSubviews:YES];
    self.backgroundColor = [UIColor clearColor];
    self.skView = [[SKView alloc] initWithFrame:self.bounds];
    [self addSubview:self.skView];
    [ self.skView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth |
                                       UIViewAutoresizingFlexibleHeight )];
    self.skScene = [SKScene sceneWithSize:self.skView.bounds.size];
    self.skScene.scaleMode = SKSceneScaleModeAspectFill;
    [self.skView presentScene:self.skScene];
    self.skView.showsFPS = YES;
    self.skView.showsFields = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.skScene.size = self.skView.bounds.size;
}


-(void)fireImage:(UIImage *)image size:(CGSize)size duration:(CGFloat)duration scale:(CGFloat)scale alpha:(CGFloat)alpha
{
    if (self.nowFireImageCount < self.maxFireImageCount) {
        self.nowFireImageCount++;
        SKSpriteNode *imageNode = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:image]];
        imageNode.anchorPoint = CGPointMake(0.5f, 0.0f);

        imageNode.size = size;
        imageNode.position = CGPointMake(self.center.x - imageNode.size.width / 2.0f, 0.0f);
        CGFloat moveX =  (float)rand() / RAND_MAX * self.bounds.size.width;
        CGFloat moveY =  (float)rand() / RAND_MAX * self.bounds.size.height;

        SKAction *moveTargets = [SKAction moveTo:CGPointMake(moveX, moveY) duration:duration];
        SKAction *scaleAction = [SKAction scaleTo:scale duration:duration];
        SKAction *alphaAction = [SKAction fadeAlphaTo:alpha duration:duration];
        SKAction *groupMoveAction = [SKAction group:@[moveTargets, scaleAction,alphaAction]];
        SKAction *removeTargets = [SKAction removeFromParent];

        SKAction *moveAndRemoveTargets = [SKAction sequence:@[groupMoveAction, removeTargets]];
        [imageNode runAction:moveAndRemoveTargets];
        [self.skScene addChild:imageNode];
        __weak typeof(self) weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            weakSelf.nowFireImageCount--;
        });
    }
    
}
@end
