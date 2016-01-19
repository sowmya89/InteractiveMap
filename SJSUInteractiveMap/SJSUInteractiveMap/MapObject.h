//
//  MapObject.h
//  InteractiveMap
//
//  Created by Library-SCS on 11/11/15.
//  Copyright © 2015 Library-SCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapObject : NSObject

@property (weak) NSString* time;
@property (weak) NSString* distance;

-(id) initWithTime:(NSString*)time andDistance:(NSString*)distance;

-(id) init;

@end