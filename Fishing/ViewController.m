//
//  ViewController.m
//  Fishing
//
//  Created by iOS11 on 3/31/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.gameManager = [GameManager new];
    [self.view addSubview: self.gameManager.hookView];
    for (FishView* fishView in self.gameManager.fishViews) {
        [self.view addSubview: fishView];
    }
    [self.gameManager addFishToViewController:self];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)]];
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self.gameManager selector:@selector(updateMove) userInfo:nil repeats:YES];
}
- (void) tapHandle: (UITapGestureRecognizer*) sender{
    CGPoint tapPoint = [sender locationInView:self.view];
    [self.gameManager dropHookerAtX:tapPoint.x];
    
}
- (IBAction)addFish:(id)sender {
    [self.gameManager addFishToViewController:self];
}
- (IBAction)reset:(id)sender {
    [self.gameManager.fishViews removeAllObjects];
    for (id object in self.view.subviews) {
        if ([object isKindOfClass:[FishView class]]) {
            [object removeFromSuperview];
        }
    }
    [self.gameManager addFishToViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
