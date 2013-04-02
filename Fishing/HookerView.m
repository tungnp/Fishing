//
//  HookerView.m
//  Fishing
//
//  Created by stevie nguyen on 4/2/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "HookerView.h"
@implementation HookerView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)init{
    if (self = [super init]) {
        self.image = [UIImage imageNamed:@"hook"];
        [self setFrame: CGRectMake(0, -490, 50, 490)];
        self.status = PREPARE;
    }
    return self;
}
- (CGRect) rod{
    return CGRectMake(self.center.x-10, self.center.y + 225, 20, 20);
}
- (void) updateMove{
    if (self.status == DROPPING) {
        self.center = CGPointMake(self.center.x, self.center.y+10);
        if (self.frame.origin.y + self.frame.size.height > 480) {
            self.status = DRAWINGUP;
        }
    }
    else if (self.status == DRAWINGUP){
        self.center = CGPointMake(self.center.x, self.center.y - 20);
        if (self.frame.origin.y + self.frame.size.height < 0) {
            self.status = PREPARE;
        }
    }
}
- (void) dropDownAtX: (int) x{
    if (self.status == PREPARE) {
        self.center = CGPointMake(x, self.center.y);
        self.status = DROPPING;
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


