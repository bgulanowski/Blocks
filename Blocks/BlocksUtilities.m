//
//  BlocksUtilities.m
//  Blocks
//
//  Created by Brent Gulanowski on 12-01-15.
//  Copyright (c) 2012 Marketcircle Inc. All rights reserved.
//

#import "BlocksUtilities.h"

#import "BAPrototype+Blocks.h"


@implementation BlocksUtilities

+ (BAGroup *)sampleBlocks {	
	
	BAGroup *blocks = [BAGroup groupWithSuperGroup:nil];
	NSArray *protos = [NSArray arrayWithObjects:
					   @"icosahedron",
					   @"dodecahedron",
					   @"octahedron",
					   @"cube",
					   @"tetrahedron",
					   @"block22",
					   @"block31a",
					   @"block31b",
					   @"block31c",
					   @"block32a",
					   @"block32b",
					   @"block32c",
					   @"block32d",
					   @"block33a",
					   @"block33b",
					   @"block42",
					   @"block43",
					   @"block44",
					   nil];

    double l = floor(pow([protos count], 1.0f/3.0f)) * 0.5f;
	double x = -l, y = -l, z = -l;
	
	NSMutableSet *set = [NSMutableSet setWithCapacity:[protos count]];
	
	for(NSString *selName in protos) {
        
		if(x>l) {
            ++z; x=-l;
        }
		if(z>l) {
            ++y; z=-l;
        }
                
        SEL selector = NSSelectorFromString(selName);
        NSString *name = [NSString stringWithFormat:@"Block:%@", selName];
        BATransform *xform = [BATransform translationWithX:x*5.0f y:y*5.0f z:z*5.0f];
		BAProp *prop = [BAProp propWithName:name prototype:[BAPrototype performSelector:selector] transform:xform];
		
		prop.color = [BAColor randomOpaqueColor];
		[set addObject:prop];
        ++x;
	}
	
	[blocks addProps:set];

    return blocks;
}

+ (BAGroup *)planets {
    
	BAGroup *blocks = [BAGroup groupWithSuperGroup:nil];
    BATransform *transform = [BATransform transform];

	[transform rotateX:-45 y:0 z:0];
	[blocks addPropsObject:[BAProp propWithName:@"earth" prototype:[BAPrototype earth] transform:transform]];
    
    transform = [BATransform translationWithX:5 y:20 z:5];
    [transform rotateX:-45 y:0 z:0];
    [transform scaleX:10 y:10 z:10];
	[blocks addPropsObject:[BAProp propWithName:@"jupiter" prototype:[BAPrototype jupiter] transform:transform]];

    return blocks;
}


+ (BAGroup *)boxOfBoxes {
    
	// Make a big box of cubes
	BAGroup *boxes = [BAGroup groupWithSuperGroup:nil];
	BAPrototype *proto = [BAPrototype block44];
    BATransform *xform = [BATransform scaleWithX:5.0f y:5.0f z:5.0f];
	NSInteger cx = 8, cy = 5, cz = 8, i = 0, j = 0, k = 0;
	
	for( i=0 ; i<cx; ++i ) {
		for( j=0 ; j<cy; ++j ) {
			for( k=0 ; k<cz; ++k ) {
				if( 0==k||cz-1==k||0==j||cy-1==j||0==i||cx-1==i) {
                    BATransform *copy = [BATransform transformWithMatrix4x4f:xform.transform];
                    [copy translateX:5.0f*(-i-4) y:5.0f*(-j-4) z:5.0f*(-k-4)];
					[boxes addPropsObject:[BAProp propWithName:nil prototype:proto transform:copy]];
                }
			}
		}
	}
    
    [boxes flattenPropsWithBlock:^BOOL(BAProp *prop) { return YES; }];
    boxes.mergedProp.color = [BAColor colorWithRed:0.2f green:0.2f blue:0.8f];
	
	NSLog(@"Created %lu boxes (should be %ld)", [boxes.props count], cx*cy*cz - (cx-2)*(cy-2)*(cz-2));
    
    return boxes;
}

@end
