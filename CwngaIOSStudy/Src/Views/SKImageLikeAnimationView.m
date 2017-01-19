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
@property (strong, nonatomic) SKSpriteNode *imageNode;
@property (strong, nonatomic) SKScene *skScene;

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
    [self setAutoresizesSubviews:YES];
    self.backgroundColor = [UIColor clearColor];
    self.skView = [[SKView alloc] initWithFrame:self.bounds];
    [self addSubview:self.skView];
    [ self.skView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth |
                                       UIViewAutoresizingFlexibleHeight )];
    self.imageNode = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:[[UIImage alloc] init]]];
    self.imageNode.size = self.bounds.size;

    self.skScene = [SKScene sceneWithSize:self.skView.bounds.size];
    self.skScene.scaleMode = SKSceneScaleModeAspectFill;

    [self.skScene addChild:self.imageNode];
    [self.skView presentScene:self.skScene];
    //
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.skScene.size = self.skView.bounds.size;
    self.imageNode.size = self.bounds.size;
    self.imageNode.anchorPoint = CGPointMake(0.0f, 0.0f);
}


-(void)fireImage:(UIImage *)image size:(CGSize)size duration:(CGFloat)duration scale:(CGFloat)scale alpha:(CGFloat)alpha
{
    SKSpriteNode *imageNode = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:image]];
    imageNode.anchorPoint = CGPointMake(0.5f, 0.0f);

    imageNode.size = image.size;
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
    
}
@end
