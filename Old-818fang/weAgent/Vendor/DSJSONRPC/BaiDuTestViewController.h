//
//  BaiDuTestViewController.h
//  weChat
//
//  Created by apple on 14-8-22.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "GlobalViewController.h"
//#import "BMapKit.h"

@interface BaiDuTestViewController : GlobalViewController{
//    @interface BaiDuTestViewController : GlobalViewController<BMKMapViewDelegate>{
//    IBOutlet BMKMapView* _mapView;
    DSJSONRPCCompletionHandler _forRentCompletionHandlerp;
    DSJSONRPCCompletionHandler _rentCompletionHandler;
    DSJSONRPCCompletionHandler _secondHandCompletionHandler;
    UILabel *forRentLabel;
    UILabel *rentLabel;
    UILabel *secondHandLabel;
}

@end
