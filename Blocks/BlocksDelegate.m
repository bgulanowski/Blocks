//
//  BlocksDelegate.m
//  Blocks
//
//  Created by Brent Gulanowski on 06/06/09.
//  Copyright 2009 Marketcircle Inc. All rights reserved.
//

#import "BlocksDelegate.h"

#import "BlocksDoc.h"
#import "BlocksMainView.h"
#import "BlocksBrowser.h"

#import <BAScene/BACameraSetup.h>
#import <BAScene/BAResourceStorage.h>


@implementation BlocksDelegate
@synthesize browserPanel;

@synthesize cameraSetupPanel, cameraSetup;

- (id)init {
	self=[super init];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowBecameMain:) name:NSWindowDidBecomeMainNotification object:nil];
//	if(!ResourceStorage)
//		ResourceStorage = [[BAResourceStorage alloc] init];
	return self;
}

- (NSPersistentDocument *)activeDocument {
//	return [[[NSApp mainWindow] windowController] document];
	return [[NSDocumentController sharedDocumentController] currentDocument];
}

- (void)configureCameraSetupForWindow:(NSWindow *)window {
	[self willChangeValueForKey:@"activeDocument"];
	BlocksDoc *doc = (BlocksDoc *)[[window windowController] document];
	cameraSetup.camera = doc.mainView.camera;
	[self didChangeValueForKey:@"activeDocument"];
    
    browser.blocksTC.managedObjectContext = [doc managedObjectContext];
    [browser.blocksTC fetch:nil];
}

#pragma mark Notification Handlers
- (void)windowBecameMain:(NSNotification *)notif {
	[self performSelector:@selector(configureCameraSetupForWindow:) withObject:[notif object] afterDelay:0];
}

- (void)applicationWillFinishLaunching:(NSNotification *)notif {
	self.cameraSetup = [[[BACameraSetup alloc] init] autorelease];
	[cameraSetupPanel setContentSize:[[self.cameraSetup view] frame].size];
	[cameraSetupPanel setContentView:[self.cameraSetup view]];
    
    browser = [[BlocksBrowser alloc] initWithNibName:@"BlocksBrowser" bundle:nil];
    
    browser.view.frame = [browserPanel.contentView frame];
    browserPanel.contentView = browser.view;
}

@end
