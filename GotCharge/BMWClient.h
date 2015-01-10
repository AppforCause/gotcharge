//
//  BMWClient.h
//  GotCharge
//
//  Created by Hunaid Hussain on 1/9/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"

@interface BMWClient : BDBOAuth1RequestOperationManager

+ (BMWClient *)instance;

- (void)login;

@end
