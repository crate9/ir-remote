//
//  AppDelegate.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

//Nav Bar
#define kUINavBarFont [StyleConsts getFontWithSize:20]
#define kUINavBarTextColor [UIColor whiteColor]

//Bar Button
#define kUIBarButtonTextColor [UIColor whiteColor]
#define kUIBarButtonFont [StyleConsts getFontWithSize:16]

//General
#define kBaseUILabelColor [UIColor whiteColor]
#define kBaseUITextFieldColor [UIColor blackColor]
#define kBaseUILabelFont [StyleConsts getFontWithSize:18]
#define kFontName @"Helvetica"
#define kBoldFontName @"Helvetica-Bold"
#define kBackgroundColor [UIColor colorWithRed:51.0f/255.0f green:54.0f/255.0f blue:56.0f/255.0f alpha:1.0f]

//UIButton
#define kUIButtonFont [StyleConsts getFontWithSize:22]
#define kUIButtonTextColor [UIColor blackColor]

//Sliding menu
#define kUISlidingMenuHeaderFont [StyleConsts getBoldFontWithSize:22]
#define kUISlidingMenuMainFont [StyleConsts getFontWithSize:20]
#define kUISlidingMenuTextColor [UIColor whiteColor]


//TableView
#define kUITableViewCellFont [StyleConsts getFontWithSize:18]
#define kUITableViewCellSubtitleFont [StyleConsts getFontWithSize:14]
#define kUITableViewHeaderFont [StyleConsts getFontWithSize:18]
#define kUITableViewHeaderColor [UIColor whiteColor]

#define kTableViewCellBackgroundColor [UIColor colorWithRed:239.0f/255.0f green:236.0f/255.0f blue:236.0f/255.0f alpha:1.0f]
#define kTableViewBorderWidth 2
#define kTableViewBorderColor [UIColor blackColor].CGColor


@interface StyleConsts : NSObject


+(UIFont *) getFontWithSize:(int)size;
+(UIFont *) getBoldFontWithSize:(int)size;
+(UIView *) getUITableViewHeaderWithText:(NSString *)text;
+(UIView *) getUITableViewSectionHeaderWithText:(NSString *)text;
+(void) setAppearances;

@end
