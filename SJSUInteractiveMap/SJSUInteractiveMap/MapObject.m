//
//  MapObject.m
//  InteractiveMap
//
//  Created by Library-SCS on 11/11/15.
//  Copyright © 2015 Library-SCS. All rights reserved.
//

#import "MapObject.h"

@interface MapObject ()

@end

@implementation MapObject

-(id) initWithTime:(NSString*)pTime andDistance:(NSString*)pDistance
{
    self = [super init];
    
    if ( self )
    {
        self.time = pTime;
        self.distance = pDistance;
    }
    
    return self;
}

-(id) init
{
    self = [super init];
    
    if ( self )
    {
        self.time = nil;
        self.distance = nil;
    }
    
    return self;
}

@end
