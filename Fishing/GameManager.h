//
//  GameManager.h
//  Fishing
//
//  Created by stevie nguyen on 4/2/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FishView.h"
#import "HookerView.h"
@interface GameManager : NSObject

@property (nonatomic, strong) NSMutableArray* fishViews;
@property (nonatomic, strong) HookerView* hookView;

- (void) addFishToViewController: (UIViewController*) viewController;
- (void) updateMove;
- (void) dropHookerAtX: (int) X;

@end
