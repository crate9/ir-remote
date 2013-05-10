//
//  BaseRemoteViewController.m
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "BaseRemoteViewController.h"

#import <MapBox/MapBox.h>

#import "APIHelper.h"
#import "NSUserDefaults+Helper.h"
#import "StyleConsts.h"
#import "Remote.h"


//TV power is still power for remote
//Remove dvd player channel up down buttons and info, rename guide to menu
//On changing input, change to that input's remote page

@implementation BaseRemoteViewController

@synthesize api, remoteID;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackgroundColor;
    [self setTitle:[Remote nameForRemoteType:remoteID]];
    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"TV Power" style:UIBarButtonItemStyleBordered target:self action:@selector(sendCommand:)];
    [backButton setTag:kPowerOn];
    self.navigationItem.rightBarButtonItem = backButton;
    
    
    api = [[APIHelper alloc] init];
    
    if(remoteID == kDirectTV || remoteID == kDVDPlayer)
        return;
    
    int x = kRemoteButtonEdgePadding, y = kRemoteButtonEdgePadding;
    int width = kRemoteButtonWidthChannelIPhone;
    int height = kRemoteButtonHeightIPhone;
    
    for (int i = 0; i < kNumDefaultButtonTypes; i++) {
        
        //Moved power btns to top, so skip those for layout
        if (i == kPowerOn || i == kPowerOff)
            continue;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        
        [btn setFrame:CGRectMake(x, y, width, height)];
        [btn addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:i];
        [btn setTitle:[Remote nameForButtonType:i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            
            if (i == k3 || i == k6) {
                y += kRemoteButtonHeightSpacing;
                x = kRemoteButtonEdgePadding;
            } else if (i == k9) {
                x = kRemoteButtonEdgePadding;
                y += kRemoteButtonHeightSpacing;
            } else if (i == kMute) {
                x = kRemoteButtonEdgePadding;
                y += kRemoteButtonHeightSpacing;
                
                //Add volume label
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x + 5, y, 100, 20)];
                [label setText:@"Volume"];
                [label setBackgroundColor:[UIColor clearColor]];
                [label setTextColor:kBaseUILabelColor];
                [self.view addSubview:label];
                
                //Add channel label
                x += kRemoteButtonWidthSpacingIPhone * 2;

                label = [[UILabel alloc] initWithFrame:CGRectMake(x + 5, y, 100, 20)];
                [label setText:@"Channel"];
                [label setBackgroundColor:[UIColor clearColor]];
                [label setTextColor:kBaseUILabelColor];
                [self.view addSubview:label];
                
                //Reset for next row
                x = kRemoteButtonEdgePadding;
                y += 30;

            } 
            else if (i == kVolumeUp) {
                x += kRemoteButtonWidthSpacingIPhone * 2;
                        
            } else if (i == kChannelUp) {
                x = kRemoteButtonEdgePadding;
                y+= kRemoteButtonHeightSpacing - 5;
                
            } else if (i == kVolumeDown) {
                x += kRemoteButtonWidthSpacingIPhone * 2;
            }
            else {
                x += kRemoteButtonWidthSpacingIPhone;
            }
            
        } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            if(i == kPowerOn) {
                x += kRemoteButtonWidthSpacingIPad;
            } else if ( i == kPowerOff) {
                x = kRemoteButtonEdgePadding;
                y += 80;
                
                width = kRemoteButtonWidthChannelIPhone;
                
                
            }
            else if (i == k3 || i == k6) {
                y += kRemoteButtonHeightSpacing;
                x = kRemoteButtonEdgePadding;
            } else if (i == k9) {
                
                x = kRemoteButtonWidthSpacingIPad + kRemoteButtonEdgePadding;
                y += kRemoteButtonHeightSpacing;
            } else if (i == k0) {
                x = kRemoteButtonEdgePadding;
                y += kRemoteButtonHeightSpacing;
            }
            else  {
                x += kRemoteButtonWidthSpacingIPhone;
                
            }
        }
    }
}

-(void)sendCommand:(id)sender {
    UIButton *btn = (UIButton *)sender;
    int tag = [btn tag];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if(tag == kInput) {
        
        NSArray *inputTypes = [[defaults dictionaryForKey:@"inputTypes"] allKeys];
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Input:" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
        
        int numInputTypes = [inputTypes count];
        for (int i = 0; i < numInputTypes; i++) {
            [actionSheet addButtonWithTitle:[inputTypes objectAtIndex:i]];
        }
        
        [actionSheet addButtonWithTitle:@"Cancel"];
        [actionSheet setCancelButtonIndex:numInputTypes];
        

        [actionSheet showInView:self.view];
    } else {
        NSArray *commands = [Remote getCommandsForButtonID:tag fromRemoteID:remoteID];
        float time = 0;
        for (NSString *command in commands) {
            [api performSelector:@selector(sendCommandToServer:) withObject:command afterDelay:time];
            time += 0.5;
        }
    }
    
    
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    if ( buttonIndex != [actionSheet cancelButtonIndex]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *commands = [defaults dictionaryForKey:@"inputTypes"];
        NSString *command = [commands objectForKey:[[commands allKeys] objectAtIndex:buttonIndex]];
        [api sendCommandToServer:command];
    }
}


@end
