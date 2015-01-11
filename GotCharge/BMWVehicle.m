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
//        NSLog(@"response recieved for getRange: data '%@'  error: '%@'", data, [error description]);

        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error];
        NSLog(@"response recieved for getRange: data '%@'  error: '%@'", jsonData[@"Data"], [error description]);
        NSArray *jsonArray = [NSArray arrayWithArray:jsonData[@"Data"]];
        NSLog(@"jsonArray: %@", jsonArray[0]);

        currentVehicle = [ BMWVehicle initFromJson:jsonArray[0]];
        [currentVehicle dumpVehicleInfo];
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
             @"latitude": @"LastLocation.Lat",
             @"longitude": @"LastLocation.Lng",
             };
}

+ (BMWVehicle *) initFromJson:(NSDictionary *)dictionary {
    
    NSError *error = nil;
    
    BMWVehicle *aVehicle = [MTLJSONAdapter modelOfClass: BMWVehicle.class fromJSONDictionary: dictionary error: &error];
    
    return aVehicle;
}

- (void) dumpVehicleInfo {
    NSLog(@"User Name: %@ @%@", self.name, self.vin);
    NSLog(@"License: %@", self.licensePlate);
    NSLog(@"modelSeries %@", self.modelSeries);
    NSLog(@"parkingBreakEngaged %@", self.parkingBreakEngaged);
    NSLog(@"lastBatteryLevel %f", self.lastBatteryLevel);
    NSLog(@"lastRange %f", self.lastRange);
    NSLog(@"lastFuelEfficiency %f", self.lastFuelEfficiency);
    NSLog(@"latitude %@", self.latitude);
    NSLog(@"longitude %@", self.longitude);


}
@end
