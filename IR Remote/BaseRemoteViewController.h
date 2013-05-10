//
//  BaseRemoteViewController.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIHelper.h"
#import "Remote.h"

@interface BaseRemoteViewController : UIViewController < UIActionSheetDelegate>


@property (strong, nonatomic) APIHelper *api;
@property NSInteger remoteID;

-(IBAction)sendCommand:(id)sender;
@end
