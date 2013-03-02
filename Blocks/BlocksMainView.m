//
//  BlocksMainView.m
//  Blocks
//
//  Created by Brent Gulanowski on 11-01-16.
//  Copyright 2011 Marketcircle Inc. All rights reserved.
//

#import "BlocksMainView.h"


@implementation BlocksMainView

@synthesize toolMode;


#pragma mark NSResponder
- (void)mouseDown:(NSEvent *)theEvent {
	switch (toolMode) {
        case kBuildMode:
            break;
            
        case kEditMode:
            break;
            
        case kMoveMode:
        default:
            [super mouseDown:theEvent];
            break;
    }
}


#pragma mark NSView
//- (id)initWithFrame:(NSRect)frameRect {
//	self = [super initWithFrame:frameRect];
//	if(self)
//		toolMode = kMoveMode;
//	return self;
//}
//

#pragma mark Accessors
//- (void)setToolMode:(BlocksToolMode)aMode {
//	[self willChangeValueForKey:@"toolMode"];
//	toolMode = aMode;
//	[self didChangeValueForKey:@"toolMode"];
//	NSLog(@"New mode is: %d", toolMode);
//}


@end
