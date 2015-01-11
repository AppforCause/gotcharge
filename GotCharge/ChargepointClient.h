//
//  ChargepointClient.h
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/10/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChargeStation.h"

@interface ChargepointClient : NSObject <NSXMLParserDelegate>

@property (weak, nonatomic) id delegate;


-(NSArray *)chargeStationsWithSuccess: (void (^)(NSArray *stations))success failure:(void (^)(NSError *error))failure;

@end
