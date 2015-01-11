//
//  BMWClient.m
//  GotCharge
//
//  Created by Hunaid Hussain on 1/9/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "BMWClient.h"

#define BMW_BASE_URL [NSURL URLWithString:@"http://data.api.hackthedrive.com:80/v1/"]

#define BMW_CONSUMER_KEY @"c8a89bf5-826e-41b5-b258-a21799af32aa"
#define BMW_CONSUMER_SECRET @"81b91829-433c-434a-9527-ccd69f2c36ee"
#define BMW_MOJIOAPI_TOKEN @"7d4a6df2-e30a-4fc7-a533-3740d0d1b81c"


@implementation BMWClient

// Singelton
+ (BMWClient *)instance{
    static BMWClient *instance = nil;
    
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
//        instance = [[BMWClient alloc] initWithBaseURL:BMW_BASE_URL consumerKey:BMW_CONSUMER_KEY consumerSecret:BMW_CONSUMER_SECRET];
        instance = [[BMWClient alloc] init];
    });
    
    return instance;
}

/*

- (void)login {
    // Request my request token
    [self.requestSerializer removeAccessToken];
    
    [ self fetchRequestTokenWithPath:@"oauth/request_token" method:@"POST" callbackURL:[NSURL URLWithString:@"GotCharge://oauth"] scope:nil success:^(BDBOAuthToken *requestToken) {
        NSLog(@"Got the request token");
        // Now get the access code, this would take the user to a twitter mobile screen for login credentials
        // and would return the control back to this application along with access code.
        NSString *authURL = [NSString stringWithFormat:@"https://data.api.hackthedrive.com/v1/oauth/authorize?oauth_token=%@", requestToken.token];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:authURL]];
        
    } failure:^(NSError *error) {
        NSLog(@"failure to get the request token %@", [error description]);
    }];
}
*/

- (void) getRangeWithcompletionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completion {
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSString *apiEndpoint = [NSString stringWithFormat:@"%@/Vehicles", BMW_BASE_URL];
    NSURL *url = [NSURL URLWithString:apiEndpoint];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:BMW_MOJIOAPI_TOKEN forHTTPHeaderField:@"MojioApiToken"];

    
    [request setHTTPMethod:@"GET"];
//    NSDictionary *mapData = [[NSDictionary alloc] initWithObjectsAndKeys: @"TEST IOS", @"name",
//                             @"IOS TYPE", @"typemap",
//                             nil];
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
//    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:completion];

    [postDataTask resume];

}


@end
