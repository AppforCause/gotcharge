//
//  ViewController.h
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/9/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)loginClick:(id)sender;

@end

