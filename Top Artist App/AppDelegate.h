//
//  AppDelegate.h
//  Top Artist App
//
//  Created by X Code User on 7/17/14.
//  Copyright (c) 2014 Joshua Spicer, Fabio Germann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,readonly) int networkActivityCnt;
-(void) incrementNetworkAct;
-(void) decrementNetworkAct;
-(void) resetNetworkAct;
@end
