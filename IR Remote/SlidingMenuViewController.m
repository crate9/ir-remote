//
//  AppDelegate.h
//  IR Remote
//
//  Created by Eric Williamson on 4/18/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "SlidingMenuViewController.h"

#import "AppDelegate.h"
#import "BaseMapViewController.h"
#import "BaseRemoteViewController.h"
#import "StyleConsts.h"



@implementation SlidingMenuViewController

@synthesize tableData, tableSectionTitles, sideMenu;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        
        tableSectionTitles = [[NSMutableArray alloc] initWithObjects:
                              @"REMOTES", @"OFFLINE MAPS", nil];
        
        NSMutableArray *remotes = [[NSMutableArray alloc] initWithCapacity:kNumRemoteTypes];
        
        for (int i = 0; i < kNumRemoteTypes; i++) {
            [remotes addObject:[Remote nameForRemoteType:i]];
        }
        
        tableData = [[NSMutableArray alloc] initWithObjects:
                     remotes,
                     [[NSArray alloc] initWithObjects:@"Alaska", @"Mexico", @"Costa Rica", nil],
                     nil];
        
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor =  [UIColor colorWithRed:48.0f/255.0f green:48.0f/255.0f blue:48.0f/255.0f alpha:1.0f];
    [self.tableView setBackgroundView:bgView];
    [self.tableView setRowHeight:39];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor colorWithRed:43.0f/255.0f green:43.0f/255.0f blue:43.0f/255.0f alpha:1.0f];
}


#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kUISlidingMenuSectionHeaderHeight;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [tableSectionTitles objectAtIndex:section];
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, kUISlidingMenuSectionHeaderHeight)];

    [headerView setBackgroundColor:[UIColor colorWithRed:39.0f/255.0f green:39.0f/255.0f blue:39.0f/255.0f alpha:1.0f]];
    // Add the label
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, tableView.bounds.size.width, kUISlidingMenuSectionHeaderHeight)];
    [headerLabel setBackgroundColor:[UIColor clearColor]];
    [headerLabel setFont:kUISlidingMenuHeaderFont];
    [headerLabel setTextColor:[UIColor whiteColor]];
    // do whatever headerLabel configuration you want here
    
    headerLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    [headerView addSubview:headerLabel];
    
    // Return the headerView
    return headerView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [tableData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[tableData objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 10.0f, 280.0f, 20.0f)];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = kUISlidingMenuTextColor;
        lbl.font = kUISlidingMenuMainFont;
        lbl.tag = 2; // define this as a constant
        [cell.contentView addSubview:lbl];
    }
    cell.imageView.image = nil;
    cell.accessoryView = nil;
    
    switch (indexPath.section) {
        case 0: {
            UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [shareBtn setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
            [shareBtn setFrame:CGRectMake(0, 0, 60, 35)];
            [shareBtn addTarget:self action:@selector(showShare:) forControlEvents:UIControlEventTouchUpInside];            
            cell.accessoryView = shareBtn;
            break;
        }

    }
    
    NSArray *titles = [tableData objectAtIndex:indexPath.section];
    UILabel *lbl = (UILabel *)[cell.contentView viewWithTag:2];
    [lbl setText:[titles objectAtIndex:indexPath.row]];
    
      return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // inform the delegate that something has been selected
    UIViewController *controller;
    
    switch(indexPath.section) {
        case 0:
            controller = [[BaseRemoteViewController alloc] init];
            [(BaseRemoteViewController *)controller setRemoteID:indexPath.row];
            break;
        case 1:
            controller = [[BaseMapViewController alloc] init];
            break;
        default:
            break;
    }
    
    if(controller) {
        
        
        NSArray *controllers = [NSArray arrayWithObject:controller];
        self.sideMenu.navigationController.viewControllers = controllers;
        [self.sideMenu setMenuState:MFSideMenuStateHidden];
        
    }
    
    
    
}

@end
