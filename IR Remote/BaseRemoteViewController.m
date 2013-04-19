//
//  BaseRemoteViewController.m
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "BaseRemoteViewController.h"

#import "APIHelper.h"
#import "NSUserDefaults+Helper.h"
#import "StyleConsts.h"


#define kPowerID 1
#define kVolumeUPID 2
#define kVolumeDownID 3
#define kChanUPID 4
#define kChanDownID 5
#define kInputID 6

@implementation BaseRemoteViewController

@synthesize api;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Remote"];
    self.view.backgroundColor = kBackgroundColor;
    
    api = [[APIHelper alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *url = [defaults stringForKey:@"itach_ip"];
        
    
    [api connectToServerUsingCFStream:url portNo:4998];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 0, 100, 44)];
    [btn addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:kPowerID];
    [btn setTitle:@"Power" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 50, 100, 44)];
    [btn addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Vol UP" forState:UIControlStateNormal];
    [btn setTag:kVolumeUPID];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 100, 100, 44)];
    [btn addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Vol Down" forState:UIControlStateNormal];
    [btn setTag:kVolumeDownID];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 150, 100, 44)];
    [btn addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Chan up" forState:UIControlStateNormal];
    [btn setTag:kChanUPID];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 200, 100, 44)];
    [btn addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"chan down" forState:UIControlStateNormal];
    [btn setTag:kChanDownID];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 250, 100, 44)];
    [btn addTarget:self action:@selector(sendCommand:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"input" forState:UIControlStateNormal];
    [btn setTag:kInputID];
    [self.view addSubview:btn];    
}

-(void)sendCommand:(id)sender {
    UIButton *btn = (UIButton *)sender;
    int tag = [btn tag];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *commands = [defaults dictionaryForKey:@"Panasonic"];
    
    NSString *command;
    
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
    
    NSLog(@"%@", command);
    
    const uint8_t *str = (uint8_t *)[command cStringUsingEncoding:NSASCIIStringEncoding];
    [api writeToServer:str];
}

-(void) sendPower {
    const uint8_t *str = (uint8_t *) [@"sendir,3:1,1,40064,1,5,96,24,48,24,24,24,48,24,24,24,48,24,24,24,24,24,48,24,24,24,24,24,24,24,24,1029,96,24,48,24,24,24,48,24,24,24,48,24,24,24,24,24,48,24,24,24,24,24,24,24,24,2980,9,24,24,24,48,24,24,24,48,24,24,24,24,24,48,24,24,24,24,24,24,24,24,4006\x0D" cStringUsingEncoding:NSASCIIStringEncoding];
    [api writeToServer:str];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
