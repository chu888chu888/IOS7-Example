//
//  FKViewController.h
//  LocateMap
//
//  Created by yeeku on 13-10-12.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface FKViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *latitudeField;
@property (strong, nonatomic) IBOutlet UITextField *longitudeField;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)goClicked:(id)sender;
@end
