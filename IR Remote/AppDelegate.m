//
//  AppDelegate.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "AppDelegate.h"

#import "BaseRemoteViewController.h"
#import "DDASLLogger.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "MFSideMenu.h"
#import "NSUserDefaults+Helper.h"
#import "SlidingMenuViewController.h"
#import "StyleConsts.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_WARN;
#endif


@implementation AppDelegate

@synthesize window;

-(BaseRemoteViewController *) baseRemoteViewController {
    
    BaseRemoteViewController *viewController = [[BaseRemoteViewController alloc] init];
    [viewController setRemoteID:kTV];
    return viewController;
    
}

- (UINavigationController *)navigationController {
    return [[UINavigationController alloc]
            initWithRootViewController:[self baseRemoteViewController]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [StyleConsts setAppearances];
    [self registerDefaults];
    
    //Add loggers
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    SlidingMenuViewController *menu = [[SlidingMenuViewController alloc] init];
    CGRect frame = menu.view.frame;
    frame.size.width = 270;
    [menu.view setFrame:frame];
    
    UINavigationController *navigationController = [self navigationController];
    MFSideMenu *sideMenu = [MFSideMenu menuWithNavigationController:navigationController sideMenuController:menu];
    menu.sideMenu = sideMenu;
    self.window.rootViewController = sideMenu.navigationController;
    [sideMenu setMenuState:MFSideMenuStateVisible];
    
    
    [self.window makeKeyAndVisible];
    

    
    return YES;
}



- (void)registerDefaults {
    NSString *prefs = [[NSBundle mainBundle] pathForResource:@"Prefs"
                                                      ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:prefs];
    NSDictionary *defaults = [dict valueForKey:@"defaults"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
   
}



@end
