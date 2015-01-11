//
//  ChargeStation.h
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/10/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChargeStation : NSObject

@property(strong, nonatomic) NSString *address;
@property(strong, nonatomic) NSString *stationName;
@property( nonatomic) double latitude;
@property( nonatomic) double longtitude;
@property(strong, nonatomic)  NSString *pricePerHour;
@property(strong, nonatomic)  NSString *voltage;
@property( nonatomic) float *current;
@property(strong, nonatomic)  NSString *connector;
@property(strong, nonatomic)  NSString *startTime;
@property(strong, nonatomic)  NSString *endTime;

@end
