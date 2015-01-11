//
//  ChargeStationViewController.m
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/11/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "ChargeStationViewController.h"
#import "ChargePointCell.h"


@interface ChargeStationViewController ()

@end

@implementation ChargeStationViewController

ChargePointCell                   *_stubChargePointCell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"charge point view controller view did load");
    [self initializeView];
    
}

- (void)initializeView {
    
    [self registerChargePointCells];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blurred bkg"]];
    
    NSLog(@"total stations found %d", [self.stationArray count]);
    [self.tableView reloadData];

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //reload the table
    [self.tableView reloadData];
}


- (void)registerChargePointCells {
    
    UINib *cellNib = [UINib nibWithNibName:@"ChargePointCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"ChargePointCell"];
    _stubChargePointCell = [cellNib instantiateWithOwner:nil options:nil][0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"total sections %d", [self.stationArray count]);
    return [self.stationArray count];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    
    ChargeStation *station = [self.stationArray objectAtIndex:(long)indexPath.section];
    
    ChargePointCell *chargePointCell = (ChargePointCell *)cell;
    chargePointCell.stationNameLabel.text = station.stationName;
    chargePointCell.voltageLabel.text = station.voltage;
    chargePointCell.chargeRateLabel.text = station.pricePerHour;
    chargePointCell.closingTimeLabel.text = station.endTime;
    chargePointCell.driveTimeLabel.text = @"5 min";
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ChargeStation *station = [self.stationArray objectAtIndex:(long)indexPath.section];

    
    CGFloat height = 0;
    
    [self configureCell:_stubChargePointCell atIndexPath:indexPath];
    [_stubChargePointCell layoutSubviews];
    height = [_stubChargePointCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
//    height = 45;
    
        NSLog(@"hieght for cell at section %ld row %ld ------> %f  %@", (long)indexPath.section, (long)indexPath.row, height+1, station.stationName);
    
    
    return height + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChargePointCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    ChargeStation *station = [self.stationArray objectAtIndex:(long)indexPath.section];
    ChargePointCell *chargePointCell = (ChargePointCell *)cell;
    chargePointCell.stationNameLabel.text = station.stationName;
    chargePointCell.voltageLabel.text = station.voltage;
    chargePointCell.chargeRateLabel.text = station.pricePerHour;
    chargePointCell.closingTimeLabel.text = station.endTime;
    chargePointCell.driveTimeLabel.text = @"5 min";
    
    /*
    cell.backgroundColor = self.tableView.backgroundColor;
    
    // Get the group from the datasource.
    ALAssetsGroup *group = [self.assetGroups objectAtIndex:indexPath.row];
    [group setAssetsFilter:[ALAssetsFilter allPhotos]]; // TODO: Make this a delegate choice.
    
    // Setup the cell.
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%ld)", [group valueForProperty:ALAssetsGroupPropertyName], (long)[group numberOfAssets]];
    cell.imageView.image = [UIImage imageWithCGImage:[group posterImage]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     */
    
    return cell;
}


@end
