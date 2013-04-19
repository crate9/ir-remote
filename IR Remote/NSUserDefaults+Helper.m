//
//  AppDelegate.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "NSUserDefaults+Helper.h"


NSString *const DefaultsKeyFirstStartup  = @"isFirstStartup";


@implementation NSUserDefaults (Helper)


#pragma mark -
#pragma mark Startup

- (BOOL)isFirstStartup {
    return [self boolForKey:DefaultsKeyFirstStartup];
}

- (void)setIsFirstStartup:(BOOL)enabled {
    [self setBool:enabled forKey:DefaultsKeyFirstStartup];
}



@end
