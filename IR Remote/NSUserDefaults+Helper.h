//
//  AppDelegate.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Helper) 


@property (assign, getter=isFirstStartup, setter=setIsFirstStartup:) BOOL isFirstStartup;
@property (assign, getter=ip, setter=setITachIP:) NSString *ip;

@end
