//
//  GameManager.m
//  Fishing
//
//  Created by stevie nguyen on 4/2/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

- (id) init{
    if (self = [super init]) {
        self.fishViews = [NSMutableArray new];
        self.hookView = [HookerView new];
    }
    return self;
}
- (void) addFishToViewController: (UIViewController*) viewController{
    FishView* fishView = [FishView new];
    [self.fishViews addObject:fishView];
    [viewController.view addSubview:fishView] ;
}
- (void) updateMove{
    [self.hookView updateMove];
    for (FishView* fishView in self.fishViews) {
        [fishView updateMove];
        if (CGRectContainsPoint([self.hookView rod], [fishView catchPoint])) {
            [self bite:fishView];
        } 
    }
}
- (void) dropHookerAtX:(int) x{
    [self.hookView dropDownAtX:x];
}
- (void) bite: (FishView*) fishView{
    if (fishView.status != CAUGHT && self.hookView.status != DRAWINGUP) {
        [fishView caught];
        fishView.center = CGPointMake(self.hookView.center.x, self.hookView.frame.origin.y+self.hookView.frame.size.height + fishView.frame.size.width/2 - 25);
        self.hookView.status = DRAWINGUP;
    }
}
@end
