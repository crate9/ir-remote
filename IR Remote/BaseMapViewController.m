//
//  BaseMapViewController.m
//  IR Remote
//
//  Created by Eric Williamson on 5/7/13.
//  Copyright (c) 2013 Eric Williamson. All rights reserved.
//

#import "BaseMapViewController.h"

#import <MapBox/MapBox.h>

#import "StyleConsts.h"

@implementation BaseMapViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Remote"];
    self.view.backgroundColor = kBackgroundColor;
    
    RMMapBoxSource *tileSource = [[RMMapBoxSource alloc] initWithMapID:@"batesaz.map-stqq0oyu"];
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:tileSource];
    
    [self.view addSubview:mapView];

}


@end
