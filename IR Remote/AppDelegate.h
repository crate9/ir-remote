//
//  AppDelegate.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;

-(void) registerDefaults;

@end
