//
//  MambaLogoView.m
//  Mamba
//
//  Created by Bryant Reyn on 2021/2/16.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

#import "MambaLogoView.h"

@interface MambaLogoView()<CAAnimationDelegate>
@end

@implementation MambaLogoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

#pragma mark - 绘制Logo
- (void)drawRect:(CGRect)rect {
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    float logoW = 620.0;
    float logoH = 752.0;
    
    /* MambaLogo Left Up */
    [self addLineWithStartPoint:CGPointMake(56/logoW * width, 115/logoH * height) secondPoint:CGPointMake(103/logoW * width, 94/logoH * height) thirdlyPoint:CGPointMake(293/logoW * width, 130/logoH * height) endPoint:CGPointMake(290/logoW * width, 242/logoH * height)];
    /* MambaLogo Right Up */
    [self addLineWithStartPoint:CGPointMake(563/logoW * width, 115/logoH * height) secondPoint:CGPointMake(513/logoW * width, 94/logoH * height) thirdlyPoint:CGPointMake(326/logoW * width, 130/logoH * height) endPoint:CGPointMake(329/logoW * width, 242/logoH * height)];
    /* MambaLogo Left Up Second */
    [self addLineWithStartPoint:CGPointMake(48/logoW * width, 135/logoH * height) secondPoint:CGPointMake(286/logoW * width, 270/logoH * height) thirdlyPoint:CGPointMake(196/logoW * width, 348/logoH * height) endPoint:CGPointMake(66/logoW * width, 217/logoH * height)];
    /* MambaLogo Right Up Second */
    [self addLineWithStartPoint:CGPointMake(571/logoW * width, 135/logoH * height) secondPoint:CGPointMake(333/logoW * width, 270/logoH * height) thirdlyPoint:CGPointMake(423/logoW * width, 348/logoH * height) endPoint:CGPointMake(553/logoW * width, 217/logoH * height)];
    /* MambaLogo Down Left */
    [self addLineWithStartPoint:CGPointMake(291/logoW * width, 311/logoH * height) secondPoint:CGPointMake(219/logoW * width, 387/logoH * height) thirdlyPoint:CGPointMake(265/logoW * width, 694/logoH * height) endPoint:CGPointMake(292/logoW * width, 718/logoH * height)];
    /* MambaLogo Down Right */
    [self addLineWithStartPoint:CGPointMake(326/logoW * width, 311/logoH * height) secondPoint:CGPointMake(398/logoW * width, 387/logoH * height) thirdlyPoint:CGPointMake(352/logoW * width, 694/logoH * height) endPoint:CGPointMake(325/logoW * width, 718/logoH * height)];
}

#pragma mark - MambaLogo Line
- (void)addLineWithStartPoint:(CGPoint)startPoint secondPoint:(CGPoint)secondPoint thirdlyPoint:(CGPoint)thirdlyPoint endPoint:(CGPoint)endPoint{
    /// draw the bezierPath
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:startPoint];
    [bezierPath addLineToPoint:secondPoint];
    [bezierPath addLineToPoint:thirdlyPoint];
    [bezierPath addLineToPoint:endPoint];
    [bezierPath closePath];

    /// add the shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor colorWithRed:255/255.0 green:208/255.0 blue:44/255.0 alpha:1].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    shapeLayer.path = bezierPath.CGPath;
    
    /// add the stroke animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"strokeEnd";
    animation.duration = 2.5;
    animation.fromValue = @0;
    shapeLayer.strokeEnd = 1;
    animation.delegate = self;
    [shapeLayer addAnimation:animation forKey:@"mambalineAnimation"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        for (id layer in self.layer.sublayers) {
            if ([layer isKindOfClass:[CAShapeLayer class]]) {
                CAShapeLayer *shapeLayer = (CAShapeLayer *)layer;
                shapeLayer.fillColor = [UIColor colorWithRed:255/255.0 green:208/255.0 blue:44/255.0 alpha:1].CGColor;
            }
        }
    }
}

@end
