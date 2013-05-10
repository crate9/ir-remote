//
//  Remote.m
//  IR Remote
//
//  Created by Eric Williamson on 5/7/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "Remote.h"

@implementation Remote

+(NSString *)nameForButtonType:(NSInteger)buttonType {
    
    switch (buttonType) {
        case kPowerOn:
            return @"Power On";
        case kPowerOff:
            return @"Power Off";
        case kVolumeUp:
        case kChannelUp:
            return @"+";
        case kVolumeDown:
        case kChannelDown:
            return @"-";
        case k1:
            return @"1";
        case k2:
            return @"2";
        case k3:
            return @"3";
        case k4:
            return @"4";
        case k5:
            return @"5";
        case k6:
            return @"6";
        case k7:
            return @"7";
        case k8:
            return @"8";
        case k9:
            return @"9";
        case k0:
            return @"0";
        case kInput:
            return @"Input";
        case kMute:
            return @"Mute";
        default:
            return @"UNIMPLEMENTED";
    }
    
}

+(NSString *)nameForRemoteType:(NSInteger)remoteType {
    switch (remoteType) {
        case kTV:
            return @"TV";
        case kDirectTV:
            return @"Direct TV";
        case kDVDPlayer:
            return @"DVD";
        case kHotKeys:
            return @"HotKeys";
        default:
            return @"UNIMPLEMENTED";
    }
}

+(NSArray *)getCommandsForButtonID:(NSInteger)buttonID fromRemoteID:(NSInteger)remoteID {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *commands = [defaults dictionaryForKey:[Remote nameForRemoteType:remoteID]];
    
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    switch (buttonID) {
        case kPowerOn:
        case kPowerOff:
            [results addObject:[commands objectForKey:@"powerOn"]];
            [results addObject:[commands objectForKey:@"powerOff"]];
            break;
        case kVolumeUp:
            [results addObject:[commands objectForKey:@"volUp"]];
            break;
        case kVolumeDown:
            [results addObject:[commands objectForKey:@"volDown"]];
            break;
        case kChannelUp:
            [results addObject:[commands objectForKey:@"chanUp"]];
            break;
        case kChannelDown:
            [results addObject:[commands objectForKey:@"chanDown"]];
            break;
        case kPlay:
            [results addObject:[commands objectForKey:@"play"]];
            break;
        case kPause:
            [results addObject:[commands objectForKey:@"pause"]];
            break;
        case kRewind:
            [results addObject:[commands objectForKey:@"rewind"]];
            break;
        case kFastForward:
            [results addObject:[commands objectForKey:@"fastFoward"]];
            break;
        case kStop:
            [results addObject:[commands objectForKey:@"stop"]];
            break;
        case kUp:
            [results addObject:[commands objectForKey:@"up"]];
            break;
        case kDown:
            [results addObject:[commands objectForKey:@"down"]];
            break;
        case kLeft:
            [results addObject:[commands objectForKey:@"left"]];
            break;
        case kRight:
            [results addObject:[commands objectForKey:@"right"]];
            break;
        case kSelect:
            [results addObject:[commands objectForKey:@"select"]];
            break;
        case kGuide:
            [results addObject:[commands objectForKey:@"guide"]];
            break;
        case kInfo:
            [results addObject:[commands objectForKey:@"chanDown"]];
            break;
        default:
            [results addObject:[commands objectForKey:[[Remote nameForButtonType:buttonID] lowercaseString]]];
            break;
    }
    
    return results;
}

@end
