//
//  BlocksDelegate.h
//  Blocks
//
//  Created by Brent Gulanowski on 06/06/09.
//  Copyright 2009 Marketcircle Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <BAScene/BAScene.h>


@class BACameraSetup, BlocksBrowser;

@interface BlocksDelegate : BAScene {

	NSWindow *cameraSetupPanel;	
	BACameraSetup *cameraSetup;
    BlocksBrowser *browser;
}

@property (retain) IBOutlet NSWindow *cameraSetupPanel;
@property (assign) IBOutlet NSPanel *browserPanel;
@property (retain) BACameraSetup *cameraSetup;

- (NSPersistentDocument *)activeDocument;

@end
