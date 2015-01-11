//
//  DashBoardViewController.h
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/9/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "XMLParseDone.h"
#import <UIKit/UIKit.h>

@interface DashBoardViewController : UIViewController <XMLParseDone>
- (IBAction)MenuClick:(id)sender;
- (IBAction)HamburgerMenuClick:(id)sender;

@end
