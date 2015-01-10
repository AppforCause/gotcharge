//
//  BMWClient.h
//  GotCharge
//
//  Created by Hunaid Hussain on 1/9/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

//#import "BDBOAuth1RequestOperationManager.h"
#import <Foundation/Foundation.h>

//@interface BMWClient : BDBOAuth1RequestOperationManager
@interface BMWClient : NSObject


+ (BMWClient *)instance;
//
//- (void)login;

- (void) getRangeWithcompletionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completion;

@end
