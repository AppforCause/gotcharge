//
//  BMWVehicle.m
//  GotCharge
//
//  Created by Hunaid Hussain on 1/10/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "BMWVehicle.h"
#import "BMWClient.h"

@implementation BMWVehicle

+ (BMWVehicle *)currentVehicle {
    
    __block BMWVehicle *currentVehicle = nil;
    
    [[BMWClient instance] getRangeWithcompletionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"response recieved for getRange: response '%@'  error: '%@'", response, [error description]);
        currentVehicle = [ BMWVehicle initFromJson:response];
        
    }];
    
    
    return currentVehicle;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"Name",
             @"vin": @"VIN",
             @"licensePlate": @"LicensePlate",
             @"modelSeries": @"ModelSeries",
             @"doorsAjar": @"DoorsAjar",
             @"parkingBreakEngaged": @"ParkingBreakEngaged",
             @"lastBatteryLevel": @"LastBatteryLevel",
             @"lastRange": @"LastRange",
             @"lastFuelEfficiency": @"LastFuelEfficiency",
             @"latitude": @"Location/Lat",
             @"longitude": @"Location/Lng",
             };
}

+ (BMWVehicle *) initFromJson:(NSDictionary *)dictionary {
    
    NSError *error = nil;
    
    BMWVehicle *aVehicle = [MTLJSONAdapter modelOfClass: BMWVehicle.class fromJSONDictionary: dictionary error: &error];
    
    return aVehicle;
}

- (void) dumpVehicleInfo {
//    NSLog(@"User Name: %@ @%@", self.name, self.screenName);
//    NSLog(@"User id: %d", self.userId);
//    NSLog(@"Profile Image %@", self.profileImageUrl);
//    NSLog(@"Description %@", self.description);
}
@end
