//
//  DashBoardViewController.m
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/9/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "DashBoardViewController.h"
#import "RNFrostedSidebar.h"
#import "BMWClient.h"
#import "KAProgressLabel.h"

@interface DashBoardViewController ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@property (nonatomic, strong) BMWClient         *bmwClient;

@property (weak, nonatomic) IBOutlet KAProgressLabel *batteryLevelProgress;

@end

@implementation DashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
    self.bmwClient = [[BMWClient alloc] init];
    NSLog(@"dash view controlled view did load");
    
    self.batteryLevelProgress.progressLabelVCBlock = ^(KAProgressLabel *label, CGFloat progress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [label setText:[NSString stringWithFormat:@"%.0f%%", (progress*100)]];
        });
    };
    
    [self.batteryLevelProgress setBackBorderWidth: 10.0];
    [self.batteryLevelProgress setFrontBorderWidth: 9.8];
    [self.batteryLevelProgress setColorTable: @{
                                  NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):[UIColor redColor],
                                  NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):[UIColor greenColor]
                                  }];
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

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %i",index);
    
    if (index == 2) {
        [sidebar dismissAnimated:YES completion:nil];
    }
    [self.bmwClient getRangeWithcompletionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"response recieved for getRange: data '%@'  error: '%@'", data, [error description]);
    }];
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
    }
}

#pragma mark - FrostedMenuBarTap

- (void)launchSideBarMenu {
    
    NSArray *images = @[
                        [UIImage imageNamed:@"gear"],
                        [UIImage imageNamed:@"profile"],
                        [UIImage imageNamed:@"star"],
                        ];
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        ];
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
    //    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
    //    callout.showFromRight = YES;
    [callout show];
}

- (IBAction) menuBarTapped:(UITapGestureRecognizer *) tapGesture {
    NSLog(@"Side bar tapped");
    [self launchSideBarMenu];
}

- (IBAction)MenuClick:(id)sender {
     NSLog(@"Side bar tapped");
}

- (IBAction)HamburgerMenuClick:(id)sender {
     NSLog(@"Side bar tapped");
     [self launchSideBarMenu];
}

#pragma mark - delegate

- (void)progressLabel:(KAProgressLabel *)label progressChanged:(CGFloat)progress
{
    [label setText:[NSString stringWithFormat:@"%.0f%%", (progress*100)]];
}

@end
