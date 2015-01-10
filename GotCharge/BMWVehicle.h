//
//  BMWVehicle.h
//  GotCharge
//
//  Created by Hunaid Hussain on 1/10/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "Mantle.h"

// Reference
//Vehicle {
//    OwnerId (string, optional),
//    MojioId (string, optional),
//    Name (string, optional),
//    VIN (string, optional),
//    LicensePlate (string, optional),
//    ModelSeries (string, optional),
//    ModelCountryType (string, optional) = ['Unknown' or 'ECE' or 'US'],
//    GearboxType (string, optional) = ['Unknown' or 'Manual' or 'Automatic' or 'Steptronic' or 'Sequential' or 'DSG'],
//    EngineType (string, optional) = ['Unknown' or 'Gasoline' or 'GasolineInjection' or 'Diesel' or 'DieselDirect' or 'Hybrid' or 'Electric'],
//    SteeringType (string, optional) = ['Unknown' or 'RHD' or 'LHD'],
//    LastDrivingExperienceControl (string, optional) = ['Unknown' or 'Comfort' or 'Eco' or 'Sport' or 'EcoPro' or 'SportPlus'],
//    DoorsAjar (string, optional) = ['None' or 'FrontLeft' or 'FrontRight' or 'RearLeft' or 'RearRight'],
//    ParkingBreakEngaged (boolean, optional),
//    LastGear (string, optional) = ['Unknown' or 'N' or 'P' or 'R' or 'D' or 'D1' or 'D2' or 'First' or 'Second' or 'Third' or 'Fourth'],
//    LastDrivingDirection (string, optional) = ['Unknown' or 'Stopped' or 'Forwards' or 'Backwards'],
//    LastAcceleratorPedal (number, optional),
//    LastPassengerPresence (string, optional) = ['Unknown' or 'FrontLeft' or 'FrontRight' or 'RearLeft' or 'RearRight' or 'RearCenter'],
//    LastOrientation (Gyroscope, optional),
//    LastBatteryLevel (number, optional),
//    LastRange (number, optional),
//    IgnitionOn (boolean, optional),
//    LastTripEvent (string, optional),
//    LastLocationTime (string, optional),
//    LastLocation (Location, optional),
//    LastSpeed (number, optional),
//    FuelLevel (number, optional),
//    LastAcceleration (number, optional),
//    LastAccelerometer (Accelerometer, optional),
//    LastAltitude (number, optional),
//    LastBatteryVoltage (number, optional),
//    LastDistance (number, optional),
//    LastHeading (number, optional),
//    LastOdometer (number, optional),
//    LastRpm (number, optional),
//    LastFuelEfficiency (number, optional),
//    CurrentTrip (string, optional),
//    LastTrip (string, optional),
//    LastContactTime (string, optional),
//    MilStatus (boolean, optional),
//    DiagnosticCodes (DTCStatus, optional),
//    FaultsDetected (boolean, optional),
//    Viewers (array[Guid], optional),
//    _deleted (boolean, optional),
//    _id (string, optional)
//}
//Gyroscope {
//    X (integer, optional),
//    Y (integer, optional),
//    Z (integer, optional)
//}
//Location {
//    Lat (number, optional),
//    Lng (number, optional),
//    FromLockedGPS (boolean, optional),
//    Dilution (number, optional),
//    IsValid (boolean, optional)
//}


@interface BMWVehicle : MTLModel <MTLJSONSerializing>

@property(strong, nonatomic) NSString    *name;
@property(strong, nonatomic) NSString    *vin;
@property(strong, nonatomic) NSString    *licensePlate;
@property(strong, nonatomic) NSString    *modelSeries;
@property(strong, nonatomic) NSString    *doorsAjar;
@property(strong, nonatomic) NSString    *parkingBreakEngaged;
@property(nonatomic) double              lastBatteryLevel;
@property(nonatomic) double              lastRange;
@property(nonatomic) double              LastFuelEfficiency;
@property(nonatomic) double              latitude;
@property(nonatomic) double              longitude;



+ (BMWVehicle *)currentVehicle;

+ (BMWVehicle *) initFromJson:(NSDictionary *)dictionary;

- (void) dumpVehicleInfo;

@end
