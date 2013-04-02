//
//  FishView.h
//  Fishing
//
//  Created by iOS11 on 3/31/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MOVING 0
#define CAUGHT 1

@interface FishView : UIImageView

@property (nonatomic) int status;
@property (nonatomic) int speed;
@property (nonatomic) int vy;
- (void) updateMove;
- (void) caught;
- (CGPoint) catchPoint;
@end
