//
//  HookerView.h
//  Fishing
//
//  Created by stevie nguyen on 4/2/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#define PREPARE 0
#define DROPPING 1
#define DRAWINGUP 2

@interface HookerView : UIImageView

@property (nonatomic) int status;

- (void) updateMove;
- (void) dropDownAtX: (int) x;

- (CGRect) rod;
@end
