//
//  Remote.h
//  IR Remote
//
//  Created by Eric Williamson on 5/7/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum buttonTypes {
    kPowerOn,
    kPowerOff,
    k1,
    k2,
    k3,
    k4,
    k5,
    k6,
    k7,
    k8,
    k9,
    kInput,
    k0,
    kMute,
    kVolumeUp,
    kChannelUp,
    kVolumeDown,
    kChannelDown,
    kNumButtonTypes
} Buttons;

typedef enum remoteTypes {
    kTV,
    kDirectTV,
    kDVDPlayer,
    kHotKeys,
    kNumRemoteTypes
} Remotes;

typedef enum inputTypes {
    kInputTypeMacMini,
    kInputTypeDirectTV,
    kInputTypeDVDPlayer
} Inputs;

@interface Remote : NSObject


+(NSString *) nameForButtonType:(NSInteger) buttonType;
+(NSString *) nameForRemoteType:(NSInteger) remoteType;
@end
