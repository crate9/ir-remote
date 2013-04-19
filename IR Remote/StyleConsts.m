//
//  AppDelegate.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "StyleConsts.h"



@implementation StyleConsts

+(UIFont *)getFontWithSize:(int)size {
    return [UIFont fontWithName:kFontName size:size];
}

+(UIFont *)getBoldFontWithSize:(int)size {
    return [UIFont fontWithName:kBoldFontName size:size];
}

+(UIView *) getUITableViewHeaderWithText:(NSString *)text {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 20, 320, 50)];
    UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 20)];
    headerLbl.backgroundColor = [UIColor clearColor];
    headerLbl.text = text;
    headerLbl.font = kUITableViewHeaderFont;
    headerLbl.textColor = kBaseUILabelColor;
    headerLbl.textAlignment = NSTextAlignmentCenter;
    [view addSubview:headerLbl];
    
    return view;
}


+(UIView *) getUITableViewSectionHeaderWithText:(NSString *)text {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 280, 24)];
    headerLbl.backgroundColor = [UIColor clearColor];
    headerLbl.text = text;
    headerLbl.font = kUITableViewHeaderFont;
    headerLbl.textColor = kBaseUILabelColor;
    [view addSubview:headerLbl];
    
    return view;
}

+(void) setAppearances {
    
    
    
    //Nav Bar, Segmented Control, Toolbars
    UIImage *barBtnImg = [[UIImage imageNamed:@"barButtonBG.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
    UIImage *barBtn_selImg = [[UIImage imageNamed:@"barButtonBG_sel.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    UIImage *navBarBGImg = [[UIImage imageNamed:@"navBarBG.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    UIImage *segCtrlSelected = [[UIImage imageNamed:@"segCtrlSelected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    [[UINavigationBar appearance] setBackgroundImage:navBarBGImg forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          kUINavBarTextColor, UITextAttributeTextColor,
                                                          kUINavBarFont, UITextAttributeFont,
                                                          [NSValue valueWithUIOffset:UIOffsetMake(1, 1)], UITextAttributeTextShadowOffset,
                                                          nil]];
    

    [[UISearchBar appearance] setBackgroundImage:navBarBGImg];
    [[UIToolbar appearance] setBackgroundImage:navBarBGImg forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
   
    [[UIBarButtonItem appearance] setBackgroundImage:barBtnImg  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:barBtnImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          kUIBarButtonTextColor, UITextAttributeTextColor,
                                                          kUIBarButtonFont, UITextAttributeFont,
                                                          [NSValue valueWithUIOffset:UIOffsetMake(1, 1)], UITextAttributeTextShadowOffset,
                                                          nil] forState:UIControlStateNormal];
    
    [[UISegmentedControl appearance] setBackgroundImage:barBtnImg  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setBackgroundImage:barBtn_selImg  forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:segCtrlSelected forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //UIButton
    [[UIButton appearance] setTitleColor:kUIButtonTextColor forState:UIControlStateNormal];
    
    //UILabel
    [[UILabel appearance] setTextColor:kBaseUILabelColor];
    [[UILabel appearance] setFont:kBaseUILabelFont];
    //TextField
    [[UITextField appearance] setTextColor:kBaseUITextFieldColor];
    
    //UITableView
    [[UITableViewCell appearance] setFont:kUITableViewCellFont];

    
        
    
    
    
    
}


@end
