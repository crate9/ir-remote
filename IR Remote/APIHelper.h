//
//  APIHelper.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIHelper : NSObject <NSStreamDelegate>


-(void) connectToServerUsingCFStream:(NSString *) urlStr portNo: (uint) portNo;
-(void) sendCommandToServer:(NSString *) command;


@end
