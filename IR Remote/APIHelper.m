//
//  APIHelper.m
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "APIHelper.h"

@implementation APIHelper

NSMutableData *data;

NSInputStream *iStream;
NSOutputStream *oStream;

CFReadStreamRef readStream = NULL;
CFWriteStreamRef writeStream = NULL;

- (id)init {
    self = [super init];
    if (self) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *url = [defaults stringForKey:@"itach_ip"];
        [self connectToServerUsingCFStream:url portNo:4998];
        
        
        
    }
    return self;
}

-(void) connectToServerUsingCFStream:(NSString *) urlStr portNo: (uint) portNo {
    
    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                       (__bridge CFStringRef) urlStr,
                                       portNo,
                                       &readStream,
                                       &writeStream);
    
    if (readStream && writeStream) {
        CFReadStreamSetProperty(readStream,
                                kCFStreamPropertyShouldCloseNativeSocket,
                                kCFBooleanTrue);
        CFWriteStreamSetProperty(writeStream,
                                 kCFStreamPropertyShouldCloseNativeSocket,
                                 kCFBooleanTrue);
        
        iStream = (__bridge NSInputStream *)readStream;
        [iStream setDelegate:self];
        [iStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
        [iStream open];
        
        oStream = (__bridge NSOutputStream *)writeStream;
        [oStream setDelegate:self];
        [oStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
        [oStream open];
    }
}

-(void) sendCommandToServer:(NSString *) command {
    
    if(![command hasSuffix:@"\r"])
        command = [NSString stringWithFormat:@"%@\r", command];
    
    
    const uint8_t *str = (uint8_t *)[command cStringUsingEncoding:NSASCIIStringEncoding];
    [oStream write:str maxLength:strlen((char*)str)];
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode {
    
    switch(eventCode) {
        case NSStreamEventHasBytesAvailable:
        {
            if (data == nil) {
                data = [[NSMutableData alloc] init];
            }
            uint8_t buf[1024];
            unsigned int len = 0;
            len = [(NSInputStream *)stream read:buf maxLength:1024];
            if(len) {
                [data appendBytes:(const void *)buf length:len];
                int bytesRead = 0;
                bytesRead += len;
            } else {
                NSLog(@"No data.");
            }
            
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@", str);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"From server"
                                                            message:str
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            //[alert show];
            
            data = nil;
        } break;
        default:
            break;
    }
    
    
}

@end

