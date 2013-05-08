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




@implementation BaseRemoteViewController

@synthesize api;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackgroundColor;    
    
    
    api = [[APIHelper alloc] init];
   
    int x = kRemoteButtonEdgePadding, y = kRemoteButtonEdgePadding;
    int width = kRemoteButtonWidth;
    int height = kRemoteButtonHeight;
    
    for (int i = 0; i < kNumButtonTypes; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
       
        
        [btn setFrame:CGRectMake(x, y, width, height)];
        [btn addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:i];
        [btn setTitle:[Remote nameForButtonType:i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        if(i == kPowerOn) {
            x += kRemoteButtonWidthSpacing;
        } else if ( i == kPowerOff) {
            x = kRemoteButtonEdgePadding;
            y += 80;
        }
        else if (i == k3 || i == k6) {
            y += kRemoteButtonHeightSpacing;
            x = kRemoteButtonEdgePadding;
        } else if (i == k9) {
            x = kRemoteButtonWidthSpacing + kRemoteButtonEdgePadding;
            y += kRemoteButtonHeightSpacing;
        } else if (i == k0) {
            x = kRemoteButtonEdgePadding;
            y += kRemoteButtonHeightSpacing;
        }
        else  {
            x += kRemoteButtonWidthSpacing;
        }
        
        
        
    }
    
    
   
}

-(void)sendCommand:(id)sender {
    UIButton *btn = (UIButton *)sender;
    int tag = [btn tag];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *commands = [defaults dictionaryForKey:@"Panasonic"];
    
    NSString *command;
    
    /*
    switch (tag) {
        case kPowerID: {
            command = [commands objectForKey:@"power"];            
            break;
        }
        case kVolumeUPID: {
            command = [commands objectForKey:@"vol_up"];
            break;
        }
        case kVolumeDownID: {
            command = [commands objectForKey:@"vol_down"];
            break;
        }
        case kChanUPID: {
            command = [commands objectForKey:@"chan_up"];
            break;
        }
        case kChanDownID: {
            command = [commands objectForKey:@"chan_down"];
            break;
        }
        case kInputID: {
            command = [commands objectForKey:@"input"];
            break;
        }
        default:
            break;
    }
     */
    
    command = [NSString stringWithFormat:@"%@\r", command];
    
    
    const uint8_t *str = (uint8_t *)[command cStringUsingEncoding:NSASCIIStringEncoding];
    [api writeToServer:str];
}

-(void) sendPower {
    const uint8_t *str = (uint8_t *) [@"sendir,3:1,1,40064,1,5,96,24,48,24,24,24,48,24,24,24,48,24,24,24,24,24,48,24,24,24,24,24,24,24,24,1029,96,24,48,24,24,24,48,24,24,24,48,24,24,24,24,24,48,24,24,24,24,24,24,24,24,2980,9,24,24,24,48,24,24,24,48,24,24,24,24,24,48,24,24,24,24,24,24,24,24,4006\x0D" cStringUsingEncoding:NSASCIIStringEncoding];
    [api writeToServer:str];
}



@end
