//
//  ChargePointCell.h
//  GotCharge
//
//  Created by Hunaid Hussain on 1/11/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChargeStation.h"

@interface ChargePointCell : UITableViewCell

@property (strong, nonatomic) ChargeStation *station;
@property (weak, nonatomic) IBOutlet UILabel *stationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *voltageLabel;
@property (weak, nonatomic) IBOutlet UILabel *driveTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *reserveTimeAButon;
@property (weak, nonatomic) IBOutlet UIButton *reserveTimeBButton;
@property (weak, nonatomic) IBOutlet UIButton *reserveTimeCButton;
@property (weak, nonatomic) IBOutlet UILabel *chargeRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *closingTimeLabel;

@end
