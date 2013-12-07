//
//  BlocksDelegate.h
//  Blocks
//
//  Created by Brent Gulanowski on 06/06/09.
//  Copyright 2009-2014 Bored Astronaut. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class BACameraSetup, BlocksBrowser;

@interface BlocksDelegate : NSObject {

	NSWindow *cameraSetupPanel;	
	BACameraSetup *cameraSetup;
    BlocksBrowser *browser;
}

@property (retain) IBOutlet NSWindow *cameraSetupPanel;
@property (assign) IBOutlet NSPanel *browserPanel;
@property (retain) BACameraSetup *cameraSetup;

- (NSPersistentDocument *)activeDocument;

@end
