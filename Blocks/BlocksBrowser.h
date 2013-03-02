//
//  BlocksBrowser.h
//  Blocks
//
//  Created by Brent Gulanowski on 12-01-15.
//  Copyright (c) 2012 Marketcircle Inc. All rights reserved.
//


@class EntityInspector;

@interface BlocksBrowser : NSViewController

@property (nonatomic, assign) IBOutlet NSView *inspectorView;
@property (nonatomic, retain) EntityInspector *inspectorVC;
@property (nonatomic, assign) IBOutlet NSTreeController *blocksTC;

@property (nonatomic, assign) NSArray *selections;

@end
