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
            break;
    }
}


@end
