//
//  BMWClient.m
//  GotCharge
//
//  Created by Hunaid Hussain on 1/9/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "BMWClient.h"

#define BMW_BASE_URL [NSURL URLWithString:@"https://data.api.hackthedrive.com/v1/"]

#define BMW_CONSUMER_KEY @"c8a89bf5-826e-41b5-b258-a21799af32aa"
#define BMW_CONSUMER_SECRET @"81b91829-433c-434a-9527-ccd69f2c36ee"

@implementation BMWClient

// Singelton
+ (BMWClient *)instance{
    static BMWClient *instance = nil;
    
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        instance = [[BMWClient alloc] initWithBaseURL:BMW_BASE_URL consumerKey:BMW_CONSUMER_KEY consumerSecret:BMW_CONSUMER_SECRET];
    });
    
    return instance;
}

- (void)login {
    // Request my request token
/*    [self.requestSerializer removeAccessToken];
    
    [ self fetchRequestTokenWithPath:@"oauth/request_token" method:@"POST" callbackURL:[NSURL URLWithString:@"GotCharge://oauth"] scope:nil success:^(BDBOAuthToken *requestToken) {
        NSLog(@"Got the request token");
        // Now get the access code, this would take the user to a twitter mobile screen for login credentials
        // and would return the control back to this application along with access code.
        NSString *authURL = [NSString stringWithFormat:@"https://data.api.hackthedrive.com/v1/oauth/authorize?oauth_token=%@", requestToken.token];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:authURL]];
        
    } failure:^(NSError *error) {
        NSLog(@"failure to get the request token %@", [error description]);
    }];*/
}

@end
