//
//  ChargeStationViewController.m
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/11/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "ChargeStationViewController.h"

@interface ChargeStationViewController ()

@end

@implementation ChargeStationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return [self.stationArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChargePointCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
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
