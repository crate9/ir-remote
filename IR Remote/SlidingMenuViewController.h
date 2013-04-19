//
//  AppDelegate.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"

@interface SlidingMenuViewController : UITableViewController

@property (nonatomic, assign) MFSideMenu *sideMenu;
@property (nonatomic, retain) NSMutableArray *tableData;
@property (nonatomic, retain) NSMutableArray *tableSectionTitles;



@end
