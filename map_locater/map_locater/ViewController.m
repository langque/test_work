//
//  ViewController.m
//  map_locater
//
//  Created by CY-LQ on 2015-06-10.
//  Copyright (c) 2015 L. All rights reserved.
//

#import "ViewController.h"
#import GoogleMaps;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.868
                                                          longitude:151.2086
                                                               zoom:6];
  GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];

  GMSMarker *marker = [[GMSMarker alloc] init];
  marker.position = camera.target;
  marker.snippet = @"Hello World";
  marker.appearAnimation = kGMSMarkerAnimationPop;
  marker.map = mapView;

  self.view = mapView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#import "DemoViewController.h"

//@implementation ViewController








@end
