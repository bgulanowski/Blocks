//
//  BAPrototype+Blocks.h
//  Blocks
//
//  Created by Brent Gulanowski on 10-04-14.
//  Copyright 2010 Bored Astronaut Inc. All rights reserved.
//


#import <BAScene/BAPrototype.h>


@interface BAPrototype (Blocks)

+ (BAPrototype *)block22; // tetrahedron
+ (BAPrototype *)block31a; // triangular pyramids
+ (BAPrototype *)block31b;
+ (BAPrototype *)block31c;
+ (BAPrototype *)block32a; // wedges
+ (BAPrototype *)block32b;
+ (BAPrototype *)block32c;
+ (BAPrototype *)block32d;
+ (BAPrototype *)block33a; // prisms
+ (BAPrototype *)block33b;
+ (BAPrototype *)block33c;
+ (BAPrototype *)block42; // doubly-chipped cube
+ (BAPrototype *)block43; // chipped cube
+ (BAPrototype *)block44; // cube

+ (BAPrototype *)planetWithImageNamed:(NSString *)name;
+ (BAPrototype *)earth;
+ (BAPrototype *)jupiter;

@end
