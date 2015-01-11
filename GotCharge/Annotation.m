//
//  Annotation.m
//  GotCharge
//
//  Created by Hemen Chhatbar on 1/11/15.
//  Copyright (c) 2015 appforcause. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
/*@synthesize coordinate;
@synthesize title;
@synthesize time;
@synthesize subTitle;*/

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim

{
    
    self.coordinate=c;
    self.time=tim;
    self.subTitle=timed;
    self.title=t;
    
    return self;
    
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *)tit

{
    self.coordinate=c;
    self.title=tit;

    return self;
    
}

@end
