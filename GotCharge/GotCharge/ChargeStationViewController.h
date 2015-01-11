//
//  ChargeStationViewController.h
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/11/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChargeStationViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray   *stationArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
