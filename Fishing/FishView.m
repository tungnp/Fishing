//
//  FishView.m
//  Fishing
//
//  Created by iOS11 on 3/31/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "FishView.h"
@implementation FishView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id) init{
    if (self = [super init]) {
        [self generateFish];
    }
    return self;
}
- (CGPoint) catchPoint{
    if (self.speed > 0) {
        return CGPointMake(self.frame.origin.x+self.frame.size.width,self.center.y);
    }
    else{
        return CGPointMake(self.center.x - self.bounds.size.width/2,self.center.y);
    }
}
- (void) generateFish{
    self.vy = arc4random()%3-1;
    float y = arc4random()%240 + 80;
    self.status = MOVING;
    self.speed = arc4random()%5 +2;
    if ((arc4random())%2) {
        self.transform = CGAffineTransformIdentity;
        self.image = [UIImage imageNamed:@"fish"];
        self.frame = CGRectMake(-100, y, 100, 80);
        ;
    }
    else{
        self.transform = CGAffineTransformIdentity;
        self.image = [UIImage imageWithCGImage:[UIImage imageNamed:@"fish"].CGImage scale:1.0 orientation:UIImageOrientationUpMirrored ];
        self.frame = CGRectMake(420, y, 100, 80);
        self.speed = -self.speed;
    }
}
- (void) updateMove{
    if (self.status == MOVING) {
        self.center = CGPointMake(self.center.x + self.speed, self.center.y + self.vy);
        if (self.center.y < 40 || self.center.y >440) {
            self.vy = -self.vy;
        }
        if ((self.center.x >370 && self.speed>0) || (self.center.x < -50 && self.speed<0)) {
            [self generateFish];
        }
    }
    else if (self.status == CAUGHT){
        self.center = CGPointMake(self.center.x, self.center.y - 20);
        if (self.center.y < -100) {
            [self generateFish];
        }
    }
    
}
- (void) caught{
    if (self.status == MOVING) {
        self.status = CAUGHT;
        if (self.speed > 0 ) {
            self.transform = CGAffineTransformMakeRotation(-M_PI_2);
        }
        else {
            self.transform = CGAffineTransformMakeRotation(M_PI_2);
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
